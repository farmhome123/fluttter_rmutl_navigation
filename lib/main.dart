import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmutl_navigator/components/MyHomePage.dart';
import 'package:rmutl_navigator/service/constants.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.mitrTextTheme(Theme.of(context).textTheme),
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        accentColor: lPrimaryColor,
      ),
      home: SplashScreenView(
        duration: 8000,
        imageSize: 200,
        imageSrc: "assets/icons/rmutlicons.png",
        navigateRoute: MyHomePage(),
        text: "Application for Rmutl \n  (Jedlin) Navigation",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 18.0,
        ),
        colors: [
          Colors.pink,
          Colors.yellow,
          Colors.blue,
        ],
        backgroundColor: Colors.blue[50],
      ),
    );
  }
}
