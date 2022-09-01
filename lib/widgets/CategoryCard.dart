import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key, required this.press, required this.nameEn,required this.image,
  }) : super(key: key);
  final Function() press;
  final String nameEn;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
        color: Color(0xFF9DEC2BA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
         // color: Colors.white,
         // boxShadow: const[BoxShadow(
         //   offset: Offset(0,0),
         //   blurRadius: 1,
         // )],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           //InkWell(
           //  onTap:(){},
           //  child: const Icon(Icons.favorite_border),),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child:Image.network(
                image,
                height: 215,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Expanded(
                child: Column(
                  children: [
                    Text(nameEn,style: GoogleFonts.nunito(fontSize:16,fontWeight: FontWeight.bold),),
                    //const SizedBox(height: 3,),
                    //Text(nameAr,style: GoogleFonts.nunito(fontSize:16,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

