import 'package:flutter/material.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:forget_me_not/screens/auth/login_screen.dart';
import 'package:forget_me_not/screens/auth/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';



class OnBoardScreen2 extends StatefulWidget {
  const OnBoardScreen2({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen2> createState() => _OnBoardScreen2State();
}

class _OnBoardScreen2State extends State<OnBoardScreen2> {
  void initState(){
    //TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      String route = SharedPrefController().loggedIn ? '/home_screen' : '/login_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
              child:Container(
                height: 740,
                //width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black26, BlendMode.luminosity),
                      image: AssetImage('images/per.jpg',),
                     )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      //Image.asset(
                      //  'images/per.jpg',
                      //  height: 300,
                      //  width: 80,
                      //),

                      SizedBox(height: 600),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF9DEC2BA),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),);
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF9DEC2BA),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => RegisterScreen()),);
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),],
          )),
    );
  }
}


