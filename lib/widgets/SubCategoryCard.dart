import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategoryCard extends StatelessWidget {
  const SubCategoryCard({
    Key? key, required this.nameEn, required this.image, required this.click,
  }) : super(key: key);
  final String nameEn;
  final String image;
  final Function() click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //InkWell(
          //  onTap:(){},
          //  child: const Icon(Icons.favorite_border,),),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child:Image.network(image,
              height: 220,
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
