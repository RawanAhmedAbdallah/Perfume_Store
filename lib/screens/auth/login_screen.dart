import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/utils/helpers.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileTextController.dispose();
    _passwordTextController.dispose();
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
          'Login',
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
         //    'Login Back',
         //    style: GoogleFonts.montserrat(
         //        fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1,
         //    color: Colors.grey.shade700),
         //  ),
         //  Text(
         //    'Enter mobile & password',
         //    style: GoogleFonts.montserrat(
         //      fontWeight: FontWeight.w300,
         //      color: Colors.black45,
         //      fontSize: 15,
         //    ),
         //  ),

            TextField(
              keyboardType: TextInputType.number,
              controller: _mobileTextController,
              decoration: InputDecoration(
                hintText: 'Mobile',
                prefixIcon: const Icon(Icons.phone_android,color: Color(0xFFE5789D)),
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
                      color: Color(0xFFE5789D)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await _performLogin(),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF9DEC2BA),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),

                ),
              ),
              child:  Text('LOGIN',style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account',style: GoogleFonts.lato(),),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register_screen');
                    },
                    child: Text('Create Now!', style:GoogleFonts.montserrat(color: const Color(0xFFE5789D),),),),
              ],
            ),
            Center(
              child: TextButton(onPressed: (){
                Navigator.pushNamed(context, '/forgot_password_screen');
              },
                  style: TextButton.styleFrom(alignment: Alignment.center),
                  child: Text('Forgot Password?', style: GoogleFonts.montserrat(color: const Color(0xFFE5789D),),),),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    ApiResponse apiResponse = await AuthApiController().login(
        mobile: _mobileTextController.text,
        password: _passwordTextController.text);
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/home_screen');
    }
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
