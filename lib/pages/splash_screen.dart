import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OnBoardingPage.dart';

class SplashScreen extends StatefulWidget {
  bool isActive;
  bool isChangeTheme;

  SplashScreen({Key? key, this.isActive = false, this.isChangeTheme = false})
      : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OnBoardingPage()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Rectangle.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/Group.png",
        ),
      ),
    ));
  }
}
