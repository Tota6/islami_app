import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const routeName = "splash";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/quran/light_mode/splash@3x.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
