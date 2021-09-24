import 'package:flutter/material.dart';
import 'View/home_screen.dart';
import 'View/login_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suntastic',
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: Image.asset('images/SunSplash.jpg',fit: BoxFit.cover,),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.decoratedBoxTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        nextScreen: const LoginScreen(),
      ),
    );
  }
}
