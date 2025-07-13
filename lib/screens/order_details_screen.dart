import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/order_api_controller.dart';
import 'package:forget_me_not/models/order_details.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key,  this.id}) : super(key: key);
  final int? id;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey.shade700,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Order Details',
            style: GoogleFonts.nunito(
              fontSize: 22,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body:
       // FutureBuilder<List<OrderDetails?>>(
       //   future: OrderApiController().orderDet(),
       //  builder: (context, snapshot) {
       // if (snapshot.connectionState == ConnectionState.waiting) {
       //   return const Center(child: CircularProgressIndicator());
       // } else if (snapshot.hasData&& snapshot.data!.isNotEmpty) {
       //   print(snapshot.data!.length);
       //   return
        SingleChildScrollView(
            child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                        //snapshot.data!.length,
                      //snapshot.data!.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 0,
                            child: Container(
                              height: 70,
                              padding: const EdgeInsets.all(8.0),
                              width: 80,
                              margin: const EdgeInsets.all(4.0),
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        'ssss',
                                        //snapshot.data![index]!.id.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'dddd',
                                        //snapshot.data![index]!.total,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold),),
                                      Text(
                                        'sssssss',
                                       // snapshot.data![index]!.date,
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
                        );
                      }
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15),
                        child: Text(
                          'Order Products',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:3,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) =>
                        Card(
                          elevation: 0,
                          child: Container(
                            height: 110,
                            width: 100,
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'images/perfume.png',
                                        //controller.cartItems[index].imageUrl,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Text(
                                              'Sauvage',
                                              //controller.cartItems[index].productName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.cairo(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 30),
                                          child: Text(
                                            '22',
                                            //controller.cartItems[index].total.toString(),
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
                ]
            )
        )
    );
    }
//  return Center(
//   child: Text(
//     'NO DATA',
//     style: GoogleFonts.montserrat(
//       fontSize: 23,
//       fontWeight: FontWeight.bold,
//       color: Colors.grey.shade700,
//     ),
//   ),
// );
}
//),
//    );
//  }}