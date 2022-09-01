import 'package:flutter/material.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/screens/auth/reset_password_screen.dart';




class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with Helpers {
  late TextEditingController _mobileTextController;


  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();

  }

  @override
  void dispose() {
    _mobileTextController.dispose();
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
          'Forget Password',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 250,
                child:Image.asset('images/perfume.png')
            ),
          //  Text(
          //    'Forget Password',
          //    style: GoogleFonts.lato(
          //        fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1,color:Colors.grey),
          //  ),
          //  Text(
          //    'Enter mobile',
          //    style: GoogleFonts.lato(
          //      fontWeight: FontWeight.w500,
          //      color: Colors.black45,
          //      fontSize: 15,
          //    ),
          //  ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: _mobileTextController,
              decoration: InputDecoration(
                hintText: 'Mobile',
                prefixIcon: const Icon(Icons.phone_android,color:Color(0xFFE5789D),),
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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async => await _performForgetPassword(),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF9DEC2BA),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('SEND',style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),),),
          ],
        ),
      ),
    );
  }

  Future<void> _performForgetPassword() async {
    if (_checkData()) {
      await _forgetPassword();
    }
  }

  bool _checkData() {
    if (_mobileTextController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _forgetPassword() async {
   ApiResponse apiResponse = await AuthApiController().forgetPassword(
       mobile: _mobileTextController.text);
   if(apiResponse.success){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResetPasswordScreen(mobile: _mobileTextController.text),
      ),
    );
   }
  showSnackBar(
    context,
    message: apiResponse.message,
    error: !apiResponse.success,
  );
  }
}
