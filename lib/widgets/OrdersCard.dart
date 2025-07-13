import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    Key? key, required this.press, required this.orderProductsCount, required this.total, required this.date, required this.paymentType, required this.status,
  }) : super(key: key);
  final Function() press;
  final String total;
  final String date;
  final String paymentType;
  final String status;
  final String orderProductsCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: press,
      child: Card(
          elevation: 0,
          child: Container(
          height: 120,
          padding: const EdgeInsets.all(8.0),
      width: 100,
      margin: const EdgeInsets.all(4.0),
        child :Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderProductsCount,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(paymentType,style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold),),
              Text(total,style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold),),
              Text(status,style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold),),
              Text(
                total,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    )
    )
    );
  }
}