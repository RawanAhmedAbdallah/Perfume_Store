import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:forget_me_not/get/cart_getx_controller.dart';
import 'package:forget_me_not/models/cart.dart';
import 'package:forget_me_not/models/product_details.dart';
import 'package:forget_me_not/new_model/product.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:forget_me_not/screens/cart_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsInfo extends StatelessWidget {
  final String nameEn;
  final String infoEn;
  final String price;
  final double rate;

  const ProductsInfo({
    required this.nameEn,
    required this.infoEn,
    required this.price,
    required this.rate,
    Key? key,
  }) : super(key: key);

 // final controller = Get.find<FavoriteGetxController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  nameEn,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

           // Text(nameAr,style: GoogleFonts.cairo( fontSize: 18,
           //   fontWeight: FontWeight.bold,
           //   color: Colors.black,),),
            // Obx(
            //       () => Container(
            //     padding: const EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(0.4),
            //       shape: BoxShape.circle,
            //     ),
               // child: InkWell(
               //   onTap: () {
               //     controller.manageFavourites(productId);
               //   },
               //   child: controller.isFavourites(productId)
               //       ? const Icon(
               //     Icons.favorite,
               //     color: Colors.red,
               //     size: 20,
               //   )
               //       : const Icon(
               //     Icons.favorite_outline,
               //     color: Colors.black,
               //     size: 20,
               //   ),
               // ),

            ],
          ),
          Row(
            children: [
             Text(
               price,style: GoogleFonts.lato(
               fontSize: 16,
                 fontWeight: FontWeight.bold,color: Colors.grey.shade500),
             ),
              const SizedBox(
                width: 8,
              ),
             const Spacer(),
          RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 25,
          itemPadding: const EdgeInsets.symmetric(horizontal: 0),
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
            ]),
          const SizedBox(height: 12,),
          SizedBox(
              child:Text(
                infoEn,
                style: GoogleFonts.lato(
                  height: 2,
                wordSpacing: 3,
                fontWeight: FontWeight.bold,fontSize: 18,),
                maxLines: 3,
                textDirection: TextDirection.ltr,
                ),
          ),
          const SizedBox(height: 8,),
        //SizedBox(
        //    child:Text(
        //      infoAr,
        //      style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 13),
        //      maxLines: 3,
        //      textDirection: TextDirection.rtl,
        //    ),
        //),
       const SizedBox(height: 65,),
   //ElevatedButton.icon(
   //  onPressed: () {
   //    Navigator.push(context,
   //      MaterialPageRoute(builder: (context) => const CartScreen()),);
   //  },
   //  icon: Icon(Icons.shopping_cart_sharp,size: 22),
   //  label: Text("Add To Cart",style: GoogleFonts.nunito(fontSize: 18,fontWeight:FontWeight.bold),),
   //  style: ElevatedButton.styleFrom(
   //    backgroundColor: const Color(0xFF9DEC2BA),
   //    minimumSize: const Size(double.infinity, 50),
   //    shape: RoundedRectangleBorder(
   //      borderRadius: BorderRadius.circular(30)
   //),
   //
   // // SizedBox(height: 20,),

   ],
      ),
    );
  }
  }



