import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/address_api_controller.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/get/address_getx_controller.dart';
import 'package:forget_me_not/models/addresses.dart';
import 'package:forget_me_not/models/user.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateAddressScreen extends StatefulWidget {
  const CreateAddressScreen({Key? key, this.address, this.id, }) : super(key: key);
  final Address? address;
  final int? id;

  @override
  State<CreateAddressScreen> createState() => _CreateAddressScreenState();
}

class _CreateAddressScreenState extends State<CreateAddressScreen> with Helpers {


  late TextEditingController _nameTextController;
  late TextEditingController _infoTextController;
  late TextEditingController _contactNumberTextController;
  int? _selectedCityId;


  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController(text: widget.address?.name);
    _infoTextController = TextEditingController(text: widget.address?.info);
    _contactNumberTextController = TextEditingController(text: widget.address?.contactNumber);
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _infoTextController.dispose();
    _contactNumberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F5F2),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFE5789D),),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 250,
                child: Image.asset('images/perfume.png')
            ),
            TextField(
              keyboardType: TextInputType.name,
              controller: _nameTextController,
              decoration: InputDecoration(
                hintText: 'Name',
                prefixIcon: const Icon(Icons.person, color: Color(0xFFE5789D)),
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
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: _infoTextController,
              decoration: InputDecoration(
                hintText: 'Info',
                prefixIcon: const Icon(Icons.info, color: Color(0xFFE5789D)),
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
                    color: Color(0xFFE5789D),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: _contactNumberTextController,
              decoration: InputDecoration(
                hintText: 'Contact Number',
                prefixIcon: const Icon(
                    Icons.contact_phone, color: Color(0xFFE5789D)),
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

            const SizedBox(height: 10),
            FutureBuilder<List<City>>(
              future: AuthApiController().getCity(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return DropdownButton<int>(
                    isExpanded: true,
                    onChanged: (int? value) {
                      setState(() => _selectedCityId = value);
                    },
                    value: _selectedCityId,
                    hint: Text(
                      'Select the City',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    dropdownColor: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                    items: snapshot.data!.map((City city) {
                      return DropdownMenuItem<int>(
                        value: city.id,
                        child: Text(city.nameEn),
                        onTap: () {},
                        // enabled: false,
                      );
                    }).toList(),
                  );
                } else {
                  return Container();
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await _performSave()
                ;
              },
              //async => await _performSave(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9DEC2BA),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Create Address', style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get title {
    return isNewAddress
        ? AppLocalizations.of(context)!.new_address
        : AppLocalizations.of(context)!.update_address;
  }

  bool get isNewAddress => widget.address == null;

  Future<void> _performSave() async {
    if (_checkData()) {
      await _save();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _infoTextController.text.isNotEmpty &&
        _contactNumberTextController.text.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _save() async {
    //AddressGetxController addressGetxController = Get.find();
    ApiResponse apiResponse = isNewAddress
        ? await AddressGetxController.to.createAddress(
        name: _nameTextController.text,
        info: _infoTextController.text,
        contactNumber: _contactNumberTextController.text,
        cityId: _selectedCityId!)
        : await AddressGetxController.to.updateAddress(index: widget.id!);

    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.success);
    if (apiResponse.success) {
      isNewAddress ? clear() : Navigator.pop(context);
    }
  }

  Address get address {
    Address address = isNewAddress ? Address() : widget.address!;
    address.name = _nameTextController.text;
    address.info = _infoTextController.text;
    address.cityId = _selectedCityId.toString() as int;
    address.contactNumber =
    (SharedPrefController().getByKe<int>(key: PrefKeys.id.name) ??
        -1) as String;
    return address;
  }

  void clear() {
    _nameTextController.clear();
    _infoTextController.clear();
    _contactNumberTextController.clear();
  }
}
