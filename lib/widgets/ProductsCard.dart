import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key,
    required this.press,
    required this.nameEn,
    required this.image,
    required this.infoEn,
    required this.price
  }) : super(key: key);
  final Function() press;
  final String nameEn;
  final String price;
  final String image;
  final String infoEn;

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
    height:250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1
          )
        ]
      ),
      child:InkWell(
      onTap: press,
      child: Stack(
       alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFEFBF6),
             boxShadow: const[BoxShadow(
               offset: Offset(0,0),
               blurRadius: 2,
               color: Colors.black26,
             )],
            ),
          ),
          Positioned(
            top:32,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              width: 150,
              child: Image.network(image, fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color:Colors.grey,
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
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
              right: 20,
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nameEn,style: GoogleFonts.montserrat(),)
                ],
              ),
          ),
          ),
      //    Positioned(
      //      top: 80,
      //      right: 20,
      //      child: Padding(
      //        padding: const EdgeInsets.symmetric(horizontal: 16),
      //        child: Column(
      //          crossAxisAlignment: CrossAxisAlignment.start,
      //          children: [
      //            Text('سوفاج',style: GoogleFonts.cairo(),)
      //          ],
      //        ),
      //      ),
      //    ),
          SizedBox(height: 5,),
          Positioned(
            top: 105,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child:Text(
                      infoEn,style: GoogleFonts.montserrat(),
                      maxLines: 3,
                      textDirection: TextDirection.ltr,
                     // / overflow: TextOverflow.ellipsis,
                  ),
                  )
                ],
              ),
            ),
          ),
       // Positioned(
       //   top: 120,
       //   right: 20,
       //   child: Padding(
       //     padding: const EdgeInsets.symmetric(horizontal: 16),
       //     child: Column(
       //       crossAxisAlignment: CrossAxisAlignment.start,
       //       children: [
       //         Text('تم إطلاقه في عام 2018 ،'
       //             ' ويحتوي على البرغموت وفلفل سيتشوان واللافندر '
       //             'واليانسون النجمي وجوزة الطيب ؛'
       //             ' الروائح الأساسية هي الأمبروكسان والفانيليا',style: GoogleFonts.cairo(),)
       //       ],
       //     ),
       //   ),
       // ),
          Positioned(
            top: 145,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(price,style: GoogleFonts.lato(),)
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color:Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(left: 1),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

