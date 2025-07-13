import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/order_api_controller.dart';
import 'package:forget_me_not/models/order.dart';
import 'package:forget_me_not/screens/order_details_screen.dart';
import 'package:forget_me_not/widgets/OrdersCard.dart';
import 'package:google_fonts/google_fonts.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderScreen> {
  int? _selectPaymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9F5F2),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Orders',
            style: GoogleFonts.montserrat(color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        // actions: [
        //   IconButton(
        //       onPressed: () {}, icon: const Icon(Icons.delete_rounded)),
        // ],
        // iconTheme: IconThemeData(color: Colors.grey.shade700,),
        ),
        body: FutureBuilder<List<Order?>>(
            future: OrderApiController().read(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                print(snapshot.data!.length);
                return SingleChildScrollView(
                  child: Column(
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              return OrdersCard(
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        OrderDetailsScreen(
                                            id: snapshot.data![index]!.id)),);
                                },
                                 orderProductsCount: snapshot.data![index]!
                                    .orderProductsCount,
                                total:  snapshot.data![index]!.total,
                                date: snapshot.data![index]!.date,
                                paymentType: snapshot.data![index]!.paymentType,
                                status: snapshot.data![index]!.status,

                              );
                            }
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                         //   FutureBuilder<List<Payments>>(
                         //       future: PaymentsApiController().payments(),
                         //       builder: (context, snapshot) {
                         //         return DropdownButton<int>(
                         //           isExpanded: true,
                         //           onChanged: (int? value) {
                         //             setState(() =>
                         //             _selectPaymentType = value);
                         //           },
                         //           value: _selectPaymentType,
                         //           hint: Text(
                         //             'Payment Type',
                         //             style: GoogleFonts.montserrat(
                         //               color: Colors.grey.shade700,
                         //             ),
                         //           ),
                         //           dropdownColor: Colors.grey.shade300,
                         //           borderRadius: BorderRadius.circular(20),
                         //           items: snapshot.data!.map((
                         //               Payments payment) {
                         //             return DropdownMenuItem<int>(
                         //               value: payment.id,
                         //               child: Text(payment.type),
                         //               onTap: () {},
                         //               // enabled: false,
                         //             );
                         //           }).toList(),
                         //         );
                         //       }
                         //   ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(
                                              double.infinity, 40),
                                          backgroundColor: const Color(
                                              0xff9dec2ba),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 15,
                                          ),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30),

                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text('Check out',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),),),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(
                                                double.infinity, 50),
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 30,
                                              vertical: 15,
                                            ),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  30),
                                              side: const BorderSide(
                                                color: Colors.black38,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(
                                                'Check out with ',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Container(
                                                width: 60,
                                                height: 22,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          'https://newsroom.mastercard.com/wp-content/uploads/2016/09/paypal-logo.png')),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 20,),
                            ],

                          ),
                        )
                      ]),
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
    );
  }

}