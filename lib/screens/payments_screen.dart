import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F5F2),
        appBar:  AppBar(
          backgroundColor: const Color(0xFFF9F5F2),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Payment Cards',
            style: GoogleFonts.montserrat(color: Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete_rounded)),
          ],
          iconTheme: IconThemeData(color: Colors.grey.shade700,),
        ),
        body:
        Stack(
          children: [
            Container(),
            Positioned.fill(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Container(
                    height: 110,
                    padding: const EdgeInsets.all(8.0),
                    width: 100,
                    margin: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'images/perfume.png',
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
                                Text(
                                  'Sauvage',
                                  //cartController.cartItems[index]["product"]["title"]
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'سوفاج',
                                    //cartController.cartItems[index]["product"]["description"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cairo(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '137.77',
                                  //"\$${cartController.cartItems[index]["product"]["price"]}",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.remove),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                '0',
                                //cartController.cartItems[index]["quantity"].toString()
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildBottom(),
          ],
        ));
    //      },
    //    ),
    //  );
  }

  Positioned _buildBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: 8.0,
          top: 4.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '137.77',
                      //"\$${cartController.total}",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Total doesnt include shipping',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), backgroundColor: const Color(0xFF9DEC2BA),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),

                      ),
                    ),
                    onPressed: () {},
                    child: Text('Check out',style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),),),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            SizedBox(height: 16),
            Text('Continue shopping',
              style: GoogleFonts.montserrat(fontSize: 13,),),
          ],
        ),
      ),
    );
  }}
