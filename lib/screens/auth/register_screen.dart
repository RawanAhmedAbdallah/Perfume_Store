import 'package:flutter/material.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/user.dart';




class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;

  String _gender = 'M';
  int? _selectedCityId;


  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    //_cityIdTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    //_cityIdTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF9F5F2),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color:  Color(0xFFE5789D),),
        title: Text(
          'Register',
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFFF9F5F2),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 250,
                child:Image.asset('images/perfume.png')
            ),
          //  Text(
          //    ' New Account .. ',
          //    style: GoogleFonts.montserrat(
          //        fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1, color:  Colors.grey.shade700),
          //  ),
        //  Text(
        //    'Enter new account details',
        //    style: GoogleFonts.lato(
        //      fontWeight: FontWeight.w500,
        //      color: Colors.black45,
        //      fontSize: 15,
        //    ),
        //  ),
            TextField(
              keyboardType: TextInputType.name,
              controller: _nameTextController,
              decoration: InputDecoration(
                hintText: 'Name',
                prefixIcon: const Icon(Icons.person,color: Color(0xFFE5789D)),
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
              keyboardType: TextInputType.number,
              controller: _mobileTextController,
              decoration: InputDecoration(
                hintText: 'Mobile',
                prefixIcon: const Icon(Icons.phone_iphone_sharp,color: Color(0xFFE5789D)),
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
              controller: _passwordTextController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock,color: Color(0xFFE5789D)),
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
            FutureBuilder<List<City>>(
              future: AuthApiController().getCity(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }else if(snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                    dropdownColor:  Colors.grey.shade300,
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
                }else {
                  return Container();
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    activeColor: const Color(0xFFE5789D),
                    title: Text('Male',style: GoogleFonts.montserrat(),),
                    value: 'M',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _gender = value);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    activeColor: const  Color(0xFFE5789D),
                    title: Text('Female',style: GoogleFonts.montserrat(),),
                    value: 'F',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _gender = value);
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async => await _performRegister(),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF9DEC2BA),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('REGISTER',style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty
        && _mobileTextController.text.isNotEmpty
        && _passwordTextController.text.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    ApiResponse apiResponse = await AuthApiController().register(
       user: user);
    if (apiResponse.success) Navigator.pop(context);
    showSnackBar(context, message: apiResponse.message, error: !apiResponse.success);
  }

  User get user{
    User user = User();
    user.name = _nameTextController.text;
    user.mobile = _mobileTextController.text;
    user.password = _passwordTextController.text;
    user.cityId = _selectedCityId.toString();
    user.gender = _gender;
    user.storeId = '0e5ae419-aac3-4395-a3e9-7c7c7f4e7080';
    return user;
  }
}
