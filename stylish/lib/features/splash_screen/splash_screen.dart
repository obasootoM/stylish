import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/pageview_screen/screen/pageview_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width * 1,
      height: height * 1,
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ConstImage.group34010),
            const SizedBox(width: 5,),
            Image.asset(ConstImage.stylish)
          ]),
    );
  }
}
