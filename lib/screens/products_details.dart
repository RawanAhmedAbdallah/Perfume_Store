import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/products_api_controller.dart';
import 'package:forget_me_not/get/cart_getx_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/cart.dart';
import 'package:forget_me_not/models/product_details.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:forget_me_not/screens/cart_screen.dart';
import 'package:forget_me_not/widgets/products_info.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductDetailsScreen extends StatefulWidget {
 const ProductDetailsScreen({Key? key, this.id}) : super(key: key);
final int? id;


@override
State<ProductDetailsScreen> createState() => _ProductsScreenState();
}

  class _ProductsScreenState extends State<ProductDetailsScreen> {

  CarouselController carouselController = CarouselController();
  CartGetxController controller = Get.put<CartGetxController>(CartGetxController());
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade700,),
         elevation: 0,
         backgroundColor: Colors.transparent,
         centerTitle: true,
         title: Text('Product Details',
         style: GoogleFonts.nunito(
         fontSize: 22,
           color: Colors.grey.shade700,
         fontWeight: FontWeight.bold,),
         ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: const Icon(Icons.shopping_bag)),
          ],
         ),

    body: FutureBuilder<ProductDetails?>(
    future: ProductsApiController().productsDetails(id: widget.id!),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasData) {
    print(snapshot.data!.images.length);
    return SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
      Stack(
        children:[
          CarouselSlider.builder(
          itemCount: snapshot.data!.images.length,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 350,
              autoPlay: false,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage(snapshot.data!.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children:[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.only(left: 1),
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],),
          ),
      ]
      ),
      ProductsInfo(
      nameEn: snapshot.data!.nameEn,
      //nameAr: 'سوفاج',
      infoEn: snapshot.data!.infoEn,
      //infoAr: 'تم إطلاقه في عام 2018 ،'
      //    ' ويحتوي على البرغموت وفلفل سيتشوان واللافندر '
      //    'واليانسون النجمي وجوزة الطيب ؛'
      //    ' الروائح الأساسية هي الأمبروكسان والفانيليا',
      price: snapshot.data!.price,
      rate: 3/5,
      ),

      Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton.icon(
          onPressed: () async{
         await _create(getCart(snapshot.data!));
            // Navigator.push(context,
            //   MaterialPageRoute(builder: (context) => CartScreen(id: widget.id,)));
          },
          icon: const Icon(Icons.shopping_cart_sharp,size: 22,),
          label: Text("Add To Cart",style: GoogleFonts.nunito(fontSize: 18,fontWeight:FontWeight.bold),),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF9DEC2BA),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      ],
    ),
    );
    }
    return Center(
    child: Text(
    'NO DATA',
    style: GoogleFonts.montserrat(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade700,
    ),
    ),
    );
    })

    ),
   );
  }

  Cart getCart(ProductDetails product) {
    Cart cart = Cart();
      cart.total =double.parse(product.price) ;
    cart.price = double.parse(product.price) ;
    cart.count = 1;
    cart.userId = SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)!;
    cart.productId = product.id;
    cart.imageUrl = product.imageUrl;
    cart.productName = product.nameEn;
    return cart;
  }
  Future<void> _create (Cart cart) async{
    ApiResponse apiResponse = await CartGetxController.to.create(cart);
    print(apiResponse.message);
  }
}

