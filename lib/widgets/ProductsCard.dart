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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey,
      //     blurRadius: 1
      //   )
      // ]
      ),
      child:InkWell(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
           boxShadow: [
             BoxShadow(
               color: Colors.white,
             )
           ],
          ),
          child: Stack(
            children: [
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
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(image,fit: BoxFit.cover,),
              ],
            ),
          ]),
        ),
        SizedBox(height: 40,),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Expanded(
        child: Text(
        nameEn,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      ),
          Text(price,style: GoogleFonts.lato( fontSize: 16,
            fontWeight: FontWeight.bold,),),
    ]),

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
            ],
          )
    )
    );
            
  }
}

