import 'package:flutter/material.dart';
import 'package:forget_me_not/screens/auth/change_password.dart';
import 'package:forget_me_not/screens/auth/login_screen.dart';
import 'package:forget_me_not/screens/auth/update_profile_screen.dart';
import 'package:forget_me_not/screens/faqs_screen.dart';
import 'package:forget_me_not/screens/show_address_screen.dart';
import 'package:google_fonts/google_fonts.dart';



class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  String? _language;

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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey.shade700,
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Change Language', style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Select suitable language',
                style: GoogleFonts.lato(color: Colors.grey.shade700,),),
            ),
            RadioListTile(
              contentPadding: EdgeInsets.only(left: 10),
              activeColor: const Color(0xFFE5789D),
              title: Text('English',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, color: Colors.black45),),
              value: 'en',
              groupValue: _language,
              onChanged: (String? value) {
                if (value != null)
                  setState(() => _language = value);
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.only(left: 10),
              activeColor: const Color(0xFFE5789D),
              title: Text('Arabic',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, color: Colors.black45),),
              value: 'ar',
              groupValue: _language,
              onChanged: (String? value) {
                if (value != null)
                  setState(() => _language = value);
              },
              //onChanged: (value) {
              //controller.changeLanguage(value!);
              //Get.updateLocale(Locale(value));
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 10),
              activeColor: const Color(0xFFE5789D),
              title: Text('Notifications', style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold, color: Colors.black),),
              subtitle: Text('Enable / Disable Notifications',
                style: GoogleFonts.lato(color: Colors.grey.shade700,),),
              value: _notifications,
              onChanged: (bool value) {
                setState(() => _notifications = value);
              },
            ),

            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const Icon(Icons.person, color: Color(0xFFE5789D)),
              title: Text(
                'Profile',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen()),
                );
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const Icon(
                  Icons.mobile_friendly, color: Color(0xFFE5789D)),
              title: Text(
                'Edit Mobile',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,

                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const +Icon(
                  Icons.password_outlined, color: Color(0xFFE5789D)),
              title: Text(
                'Change Password',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePassword()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const Icon(
                  Icons.location_city_sharp, color: Color(0xFFE5789D)),
              title: Text(
                'Address',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShowAddressScreen()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const Icon(Icons.message, color: Color(0xFFE5789D)),
              title: Text(
                'Contact Us',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const Icon(Icons.info, color: Color(0xFFE5789D)),
              title: Text(
                'Faqs',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaqsScreen()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const Icon(Icons.logout, color: Color(0xFFE5789D)),
              title: Text(
                'Logout',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ]),
    );
  }
}
