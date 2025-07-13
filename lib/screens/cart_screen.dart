import 'package:flutter/material.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/api/controllers/order_api_controller.dart';
import 'package:forget_me_not/get/cart_getx_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/cart.dart';
import 'package:forget_me_not/models/order.dart';
import 'package:forget_me_not/models/product_details.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:forget_me_not/screens/cart_submit_screen.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, this.id,  this.cart, }) : super(key: key);
  final int? id;
  final Cart? cart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with Helpers {
  @override
  void initState() {
    super.initState();
  }
  CartGetxController controller = Get.put<CartGetxController>(CartGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
          iconTheme: const IconThemeData(color:  Color(0xFFE5789D),),
          backgroundColor: const Color(0xFFF9F5F2),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Cart',
            style: GoogleFonts.montserrat(color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
             CartGetxController.to.clear();
            },
                icon: const Icon(Icons.delete_rounded)),
          ],
         // iconTheme: IconThemeData(color: Colors.grey.shade700,),
        ),
        body:
        GetX<CartGetxController>(
          //init: CartGetxController(),
          //global: true,
          builder: (CartGetxController controller) {
            if (controller.loading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.cartItems.isNotEmpty) {
              print(controller.cartItems.length);
              return Stack(
                children: [
                  Container(),
                  Positioned.fill(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cartItems.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) =>
                          Card(
                            elevation: 0,
                            child: Container(
                              height: 110,
                              padding: const EdgeInsets.all(8.0),
                              width: 100,
                              margin: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(
                                          controller.cartItems[index].imageUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                       Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 30),
                                            child: Text(
                                              //'سوفاج',
                                              controller.cartItems[index].productName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.cairo(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 15),
                                            child: Text(
                                              controller.cartItems[index].total.toString(),
                                              style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          CartGetxController.to.changeCount(
                                              index, controller.cartItems[index].count-1);},
                                        child: Container(
                                          color: Colors.grey.shade200,
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            controller.cartItems[index].count.toString(),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){CartGetxController.to.changeCount(index, controller.cartItems[index].count+1);},
                                        child: Container(
                                          color: Colors.grey.shade200,
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  ),
                  _buildBottom(),

                ],
              );
            } else {
              return Center(
                child:
                  Image.asset('images/cart.png',),

             //  Text(
             //    'Cart is Empty',
             //    style: GoogleFonts.montserrat(
             //      fontSize: 24,
             //      fontWeight: FontWeight.bold,
             //    ),
             //  ),
              );
            }
          },
        ),
    );
  }


  Positioned _buildBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: 8.0,
          top: 4.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                       controller.total.toString(),
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Total doesnt include shipping',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF9DEC2BA),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async{
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartSubmitScreen()));
                    },
                    child: Text('Check out', style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.bold),),),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    onPressed:  () async{
                       //await _create(getCart());
                      // Navigator.push(context,
                      //   MaterialPageRoute(builder: (context) => OrderScreen()));
                        },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Text(
                            'Check out with ',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          width: 60,
                          height: 22,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://newsroom.mastercard.com/wp-content/uploads/2016/09/paypal-logo.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

void _deleteCart(int index) async {
    ApiResponse apiResponse =
await CartGetxController.to.clear();
    showSnackBar(context,
    message: apiResponse.message, error: !apiResponse.success);
  }

  Order getCart(Cart cart) {
    Order order = Order();m
    order.total = cart.total.toString();
    order.paymentType = cart.id.toString();
    order.date = cart.id.toString();
    order.userId = SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)! as String;
    order.addressId = cart.id.toString();
    order.status =  cart.id.toString();
    order.orderProductsCount = cart.count.toString();
    return order;
  }
 // Future<void> _create (Order order) async{
 //   ApiResponse apiResponse = await OrderApiController().createOrder(
 //       cart: cart, paymentType: ApiSettings.paymentCards, addressId: ApiSettings.addresses.length);
 //   print(apiResponse.message);
 // }
  }
