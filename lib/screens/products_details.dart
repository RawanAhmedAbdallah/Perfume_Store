import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/products_api_controller.dart';
import 'package:forget_me_not/models/product_details.dart';
import 'package:forget_me_not/widgets/products_info.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductDetailsScreen extends StatefulWidget {
 const ProductDetailsScreen({Key? key, this.id}) : super(key: key);
final int? id;

@override
State<ProductDetailsScreen> createState() => _ProductsScreenState();
}

  class _ProductsScreenState extends State<ProductDetailsScreen> {
  CarouselController carouselController = CarouselController();
  // final cartController = Get.find<CartController>();
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
      CarouselSlider.builder(
        itemCount: snapshot.data!.images.length,
        carouselController: carouselController,
        options: CarouselOptions(
            height: 380,
            autoPlay: true,
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
    ],
    // AddCart(
    //   price: products.price,
    //   products: products,
    // ),

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
}

