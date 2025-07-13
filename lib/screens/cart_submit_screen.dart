import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/api/controllers/order_api_controller.dart';
import 'package:forget_me_not/api/controllers/payments_api_controller.dart';
import 'package:forget_me_not/get/cart_getx_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/cart.dart';
import 'package:forget_me_not/models/order.dart';
import 'package:forget_me_not/models/payments.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/user.dart';

class CartSubmitScreen extends StatefulWidget {
  const CartSubmitScreen({Key? key, this.cart, this.id}) : super(key: key);
  final Cart? cart;
  final int? id;
  @override
  State<CartSubmitScreen> createState() => _CartSubmitScreenState();
}

class _CartSubmitScreenState extends State<CartSubmitScreen> with Helpers {
  int? _selectedCityId;
  int? _selectedPaymentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color:  Color(0xFFE5789D),),
          title: Text(
            'Check out',
            style: GoogleFonts.montserrat(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xFFF9F5F2),
          elevation: 0,
        ),
      body:GetX<CartGetxController>(
        //init: CartGetxController(),
        //global: true,
        builder: (CartGetxController controller) {
          if (controller.loading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.cartItems.isNotEmpty) {
            print(controller.cartItems.length);
            Stack(
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30),
                                            child: Text(
                                              //'سوفاج',
                                              controller.cartItems[index]
                                                  .productName,
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
                                          padding: const EdgeInsets.only(
                                              bottom: 15),
                                          child: Text(
                                            controller.cartItems[index].total
                                                .toString(),
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
                              ],
                            ),
                          ),
                        ),
                  ),
                ),

              ],
            );

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40,),
                  FutureBuilder<List<City>>(
                    future: AuthApiController().getCity(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        return DropdownButton<int>(
                          isExpanded: true,
                          onChanged: (int? value) {
                            setState(() => _selectedCityId = value);
                          },
                          value: _selectedCityId,
                          hint: Text(
                            'Select the City',
                            style: GoogleFonts.montserrat(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down_circle, color: Colors.grey,),
                          dropdownColor: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                          items: snapshot.data!.map((City city) {
                            return DropdownMenuItem<int>(
                              value: city.id,
                              child: Text(city.nameEn),
                              onTap: () {},
                              // enabled: false,
                            );
                          }).toList(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  SizedBox(height: 50,),
                  FutureBuilder<List<Payments>>(
                    future: PaymentsApiController().payments(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        print(snapshot.data!.length);
                        return DropdownButton<int>(
                          isExpanded: true,
                          onChanged: (int? value) {
                            setState(() => _selectedPaymentId = value);
                          },
                          value: _selectedPaymentId,
                          hint: Text(
                            'Payment Type',
                            style: GoogleFonts.montserrat(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down_circle, color: Colors.grey,),
                          dropdownColor: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                          items: snapshot.data!.map((Payments payment) {
                            return DropdownMenuItem<int>(
                              value: payment.id,
                              child: Text(payment.type),
                              onTap: () {},
                              // enabled: false,
                            );
                          }).toList(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(
                    onPressed: () async {
                      await _performSave()
                      ;
                    },
                    //async => await _performSave(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9DEC2BA),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Submit', style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),
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
        }));
  }
  Future<void> _performSave() async {
    if (_checkData()) {
      await _submit();
    }
  }

  bool _checkData() {
    if (_selectedCityId.toString().isNotEmpty &&
        _selectedPaymentId.toString().isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _submit() async {
 // ApiResponse apiResponse = await OrderApiController().createOrder(
 //     addressId: _selectedCityId.toString(),
 //     paymentType: _selectedPaymentId.toString(),
 //     cart: widget.cart
 // );
 // if (apiResponse.success) Navigator.pop(context);
 // showSnackBar(context, message: apiResponse.message, error: !apiResponse.success);
  }
  Order getOrder(Order product) {
    Order order = Order();
    order.addressId = product.addressId;
    order.id = product.id;
    order.total= product.total;
    order.userId = SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)! as String;
    order.status= product.status;
    order.paymentType = product.paymentType;
    return order;
  }
  Future<void> _create (Order order) async{
    ApiResponse apiResponse = await OrderApiController().createOrder(
        cart: widget.cart!.imageUrl, paymentType: _selectedPaymentId.toString(), addressId: _selectedCityId.toString().length);
  }
// Future<void> _create (Order order) async{
//   ApiResponse apiResponse = await OrderApiController().createOrder(
//       cart: widget.cart!.imageUrl,
//       paymentType: _selectedPaymentId.toString(),
//       addressId: _selectedAddressId.toString());
//   print(apiResponse.message);
// }
}