import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/news/Home_Screen.dart';

class NewsSplashScreen extends StatefulWidget {
  @override
  State<NewsSplashScreen> createState() => _NewsSplashScreenState();
}

class _NewsSplashScreenState extends State<NewsSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NewsHomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_pic.jpg',
              fit: BoxFit.cover,
              height: height * .5,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'TOP HEADLINES',
              style: GoogleFonts.anton(
                  letterSpacing: .6,
                  color: Colors.deepPurple.shade500,
                  fontSize: 30),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SpinKitCircle(
              size: 40,
              color: Colors.deepPurple.shade400,
            )
          ],
        ),
      ),
    );
  }
}
