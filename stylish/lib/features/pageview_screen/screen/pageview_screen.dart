import 'package:flutter/material.dart';
import 'package:stylish/%20model/onboarding_model.dart';
import 'package:stylish/common/common_button.dart';
import 'package:stylish/common/common_text.dart';
import '../../authentication/signIn/screen/sign_in.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const Text(''),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  child: const Text('Skip'))
            ]),
        body: PageView.builder(
            controller: controller,
            itemCount: screen.length,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int inde) {
              setState(() {
                currentIndex = inde;
              });
            },
            itemBuilder: (context, indx) {
              return Column(
                children: [
                  Container(
                    width: width * 0.9,
                    height: height * 0.4,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Image.asset(screen[indx].image),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(screen[indx].text),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                      text: screen[indx].subText,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      size: 13),
                   SizedBox(
                    height: height *0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonButton(
                          text: 'Prev',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontsize: 15,
                          onTap: () {
                            controller.previousPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.bounceIn);
                          },
                          background: Colors.white),
                      Container(
                        height: 10.0,
                        child: ListView.builder(
                            itemCount: screen.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 15,
                                      width: currentIndex == index ? 20.0 : 8.0,
                                      decoration: BoxDecoration(
                                          color: currentIndex == index
                                              ? Colors.black
                                              : Colors.grey[400],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                      CommonButton(
                          text: 'Get started',
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontsize: 15,
                          onTap: () {
                            if (indx == screen.length - 1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()));
                            }
                            controller.nextPage(
                                duration: const Duration(microseconds: 100),
                                curve: Curves.bounceIn);
                          },
                          background: Colors.white)
                    ],
                  ),
                ],
              );
            }));
  }
}
