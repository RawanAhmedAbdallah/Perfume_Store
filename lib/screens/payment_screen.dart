import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forget_me_not/api/controllers/payments_api_controller.dart';
import 'package:forget_me_not/models/payments.dart';
import 'package:forget_me_not/widgets/card_utils.dart';
import 'package:forget_me_not/widgets/cart_type.dart';
import 'package:forget_me_not/widgets/input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  late TextEditingController _holderNameController;
  late TextEditingController _birthDateTextController;
  String? _selectedType;
  CardType cardType = CardType.Invalid;

  void getCardTypeFrmNum() {
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
          print(cardType);
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(() {
      getCardTypeFrmNum();
    });
    _birthDateTextController = TextEditingController();
    _holderNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _holderNameController.dispose();
    _birthDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F2),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Payment Options',
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFFF9F5F2),
        elevation: 0,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Holder Name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFE5789D)
                        ),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Icon(Icons.person,color:Color(0xFFE5789D),),
                      ),
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(19),
                          CardNumberInputFormatter(),
                        ],
                        decoration: InputDecoration(
                            hintText: 'Card Number',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xFFE5789D)
                              ),
                            ),
                            suffixIcon: Padding(
                              padding:  EdgeInsets.all(8),
                              child: CardUtils.getCardIcon(cardType),
                            ),
                            prefixIcon: cardType == CardType.Invalid
                                ? null
                                : const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Icon(Icons.credit_card_sharp,color:Color(0xFFE5789D),),
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: TextField(
                          controller: _birthDateTextController,
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                          onTap: () {
                            _pickDate();
                          },
                          decoration: InputDecoration(
                            hintText: 'Expire Date',
                            prefixIcon: const Icon(Icons.date_range,color:Color(0xFFE5789D),),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xFFE5789D)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              hintText: 'CVV',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFE5789D)
                                ),
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.credit_card,color:Color(0xFFE5789D),),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                              CardMonthInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              hintText: 'MM/YY',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFE5789D)
                                ),
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.credit_card,color:Color(0xFFE5789D),),
                              ),
                            ),
                          ),
                        ),
                      ],)
                    ],
                  ),
                ),
                SizedBox(height: 60,),
        //     FutureBuilder<List<Payments>>(
        //       future: PaymentsApiController().payments(),
        //       builder: (context, snapshot) {
        //         if(snapshot.connectionState == ConnectionState.waiting) {
        //           return const Center(child: CircularProgressIndicator());
        //         }else if(snapshot.hasData) {
        //           print(snapshot.data!.length);
        //           return DropdownButton<String>(
        //             isExpanded: true,
        //             onChanged: (String? value) {
        //               setState(() => _selectedType = value);
        //             },
        //             value: _selectedType,
        //             hint: Text(
        //               'Card Type',
        //               style: GoogleFonts.montserrat(
        //                 color: Colors.grey.shade700,
        //               ),
        //             ),
        //             dropdownColor:  Colors.grey.shade300,
        //             borderRadius: BorderRadius.circular(20),
        //             items: snapshot.data!.map((Payments payments) {
        //               return DropdownMenuItem<String>(
        //                 value: payments.type,
        //                 child: Text(payments.type),
        //                 onTap: () {},
        //                 // enabled: false,
        //               );
        //             }).toList(),
        //           );
        //         }else {
        //           return Container();
        //         }
        //       },
        //     ),
                const Spacer(flex: 2,),
                Padding(padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => CartScreen()));
                      },
                      icon: const Icon(Icons.credit_card_sharp, size: 22,),
                      label: Text('Add New Card', style: GoogleFonts.nunito(
                          fontSize: 18, fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9DEC2BA),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )),
                Spacer(),
              ]),
        ),
      ),
    );
  }
  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      var format = DateFormat.yMd();
      var formattedDate = format.format(date);
      _birthDateTextController.text = formattedDate;
    }
    print(date);
  }

}
