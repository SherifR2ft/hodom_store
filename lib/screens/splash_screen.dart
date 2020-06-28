import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hodomstore/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'spash_screen';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
     Future.delayed(
        const Duration(seconds: 3),
            () => {Navigator.pushNamed(context, WelcomeScreen.id)},
          );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Flexible(
              child: Image.asset('assets/logo/logo white@3x.png'
              ,fit: BoxFit.contain,),
            ),
          ),
        ),
      ),
    );
  }
}


