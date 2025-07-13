import 'package:flutter/material.dart';
import 'package:forget_me_not/models/order.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDet extends StatelessWidget {
  const OrderDet({Key? key,
    required this.press, required this.number, required this.total, required this.date,


  }) : super(key: key);
  final Function() press;
  final String number;
  final String total;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
        color: Colors.cyan,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
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
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          number,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(total,style: GoogleFonts.lato( fontSize: 16,
                        fontWeight: FontWeight.bold,),),
                      Text(date,style: GoogleFonts.lato( fontSize: 16,
                        fontWeight: FontWeight.bold,),),
                    ]),

            )
        ])
    )
    ])
    )
    );
  }
}

