import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:attendance/main.dart';
import 'package:attendance/provider/local_storage.dart';
import 'package:attendance/screen/adminHome.dart';
import 'package:attendance/screen/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion/motion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'const/app_color.dart';
import 'const/app_variable.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    loadToken();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void loadToken() async {
    String? token = await localStorage.getData('token');
    Timer(Duration(seconds: 9), () {
      if (token != null) {
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => MyAppHomePage()));
      } else {
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/static_images/s_logo.jpg'),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DefaultTextStyle(
                  style: GoogleFonts.fascinate(
                    fontSize: 30,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'SAMDECH OV - MAE \nHIGH SCHOOL \n\nRATTANAKIRI',
                        speed: Duration(milliseconds: 150),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              FutureBuilder(
                future: Future.delayed(Duration(seconds: 7)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            speed: Duration(milliseconds: 300),
                            'Build Your Future Here !',
                            textStyle: GoogleFonts.fascinate(
                              fontSize: 30,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                            colors: colorizeColors,
                          ),
                        ],
                        isRepeatingAnimation: false,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    );
                  } else {
                    return SizedBox(); // Placeholder until the future is complete
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
