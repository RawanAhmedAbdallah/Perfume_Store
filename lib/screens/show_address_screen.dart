
import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/address_api_controller.dart';
import 'package:forget_me_not/get/address_getx_controller.dart';
import 'package:forget_me_not/models/addresses.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/screens/create_address_screen.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ShowAddressScreen extends StatefulWidget {
  const ShowAddressScreen({
    Key? key, this.address,}) : super(key: key);
  final Address? address;

  @override
  State<ShowAddressScreen> createState() => _ShowAddressScreenState();
}

class _ShowAddressScreenState extends State<ShowAddressScreen> with Helpers {
  AddressGetxController controller = Get.put<AddressGetxController>(AddressGetxController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff9dec2ba),
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateAddressScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Color(0xFFE5789D),
          ),
          title: Text(
            'Address',
            style: GoogleFonts.montserrat(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xFFF9F5F2),
          elevation: 0,
        ),
        body: GetX<AddressGetxController>(
         //init: AddressGetxController(),
         //global: true,
          builder: (AddressGetxController controller) {
            if (controller.loading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.addresses.isNotEmpty) {
              print(controller.addresses.length);
              return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.addresses.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          height: 120,
                         // color: Colors.deepOrange,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const[BoxShadow(
                              offset: Offset(0,0),
                              color: Colors.white
                              //blurRadius: 1,
                        )],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                            child: ListView(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children:[
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(controller.addresses[index].name,style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                                       const SizedBox(height: 5,),
                                       Text(controller.addresses[index].info,style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                                       const SizedBox(height: 5,),
                                       Text(controller.addresses[index].contactNumber,style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                                       const SizedBox(height: 5,),
                                       Text(controller.addresses[index].cityId.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                                     ],
                                   ),
                                   Spacer(),
                                   IconButton(
                                     onPressed: () async => await delete(index: index),
                                     icon: const Icon(
                                       Icons.delete,
                                       color: Color(0xFFE5789D),
                                     ),
                                   )
                                 ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
              );
            } else {
              return Center(
                child: Text(
                  'No Data',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
        ));
  }


  Future<void> delete({required int index}) async {
    ApiResponse apiResponse =
    await AddressGetxController.to.delete(index: index);
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.success);
  }
}