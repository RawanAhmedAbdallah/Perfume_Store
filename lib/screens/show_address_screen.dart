import 'package:flutter/material.dart';
import 'package:forget_me_not/get/address_getx_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/screens/create_address_screen.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ShowAddressScreen extends StatefulWidget {
  const ShowAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowAddressScreen> createState() => _ShowAddressScreenState();
}

class _ShowAddressScreenState extends State<ShowAddressScreen> with Helpers {
  // AddressGetxController controller =
  //     Get.put<AddressGetxController>(AddressGetxController());

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
          backgroundColor: const Color(0xFF9DEC2BA),
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
        backgroundColor: Color(0xFFF9F5F2),
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
          init: AddressGetxController(),
          global: true,
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
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.location_city),
                          title: Text(controller.addresses[index].name),
                          subtitle: Text(controller.addresses[index].info),
                        // trailing: IconButton(
                        //   onPressed: () async =>
                        //       _deleteAddress(id: id),
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        // ),
                        ),
                      );
                    },
                  ));
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

  Future<void> _deleteAddress({required int id}) async {
    ApiResponse apiResponse =
        await AddressGetxController.to.deleteAddress(id:id);
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.success);
  }
}
