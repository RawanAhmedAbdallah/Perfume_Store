import 'package:flutter/material.dart';
import 'package:forget_me_not/screens/onboarding_screen/on_board_screen2.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {


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
                  decoration: const BoxDecoration(
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
                        const SizedBox(height: 550,),
                        Text(
                          'Welcome Elegant people',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sacramento(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'For an elegant scent, you are in the right store',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 35),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF9DEC2BA),
                              shape: const StadiumBorder(),

                            ),
                           onPressed: () {
                             Navigator.push(context,
                               MaterialPageRoute(builder: (context) => const OnBoardScreen2()),);
                            },
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),],
          )),
    );
  }
}


