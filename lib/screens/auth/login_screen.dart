import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/get/language_getx_controller.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  late String _language;

  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _language =
        SharedPrefController().getValueFor(key:PrefKeys.language.name) ?? 'en';
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
                backgroundColor: const Color(0xFF9DEC2BA),
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

  void _showLanguageBottomSheet() async {
    String? langCode = await showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language_title,
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.language_sub_title,
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          color: Colors.black45,
                          height: 1.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Divider(),
                      RadioListTile<String>(
                        title: Text('English', style: GoogleFonts.cairo()),
                        value: 'en',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'en');
                          }
                        },
                      ),
                      RadioListTile<String>(
                        title: Text('العربية', style: GoogleFonts.cairo()),
                        value: 'ar',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'ar');
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );

    if (langCode != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
       LanguageGetxController.to.changeLanguage();
      });
    }
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
//  Future<void> _login async {
//  final fcmToken = await FirebaseMessaging.instance.getToken();
//}
  Future<void> _login() async {
    ApiResponse apiResponse = await AuthApiController().login(
        mobile: _mobileTextController.text,
        password: _passwordTextController.text, fcm: ApiSettings.refreshFcmToken);
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
