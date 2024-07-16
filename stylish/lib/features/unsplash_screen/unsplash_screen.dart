import 'package:flutter/material.dart';
import 'package:stylish/common/common_button.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/bottom_nav-bar.dart/screen/screen.dart';

class UnsplashScreen extends StatefulWidget {
  const UnsplashScreen({super.key});

  @override
  State<UnsplashScreen> createState() => _UnsplashScreenState();
}

class _UnsplashScreenState extends State<UnsplashScreen> {
  // @override
  // void initState() {
  //   Timer(const Duration(microseconds: 100), () {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        width: width * 1,
        height: height * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ConstImage.unsplash), fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const CommonText(
              text: '      You want\nAuthentic, here\n      you go!',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              size: 40),
          const CommonText(
              text: 'find it here,buy it now!',
              fontWeight: FontWeight.normal,
              color: Colors.white,
              size: 15),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CommonButton(
                text: 'Get started',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontsize: 20,
                width: width * 9,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BottomNavBar()));
                },
                background: const Color.fromARGB(255, 233, 12, 12)),
          )
        ]),
      ),
    );
  }
}
