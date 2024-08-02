import 'package:flutter/material.dart';
import 'package:stylish/%20model/onboarding_model.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/features/onboarding_screen/widget/arrow_button.dart';

class Banners extends StatelessWidget {
 const  Banners({
    super.key, required this.controller,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.3,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 100,
                minWidth: 100              ),
              margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
              width: width * 0.9,
              height: height * 0.25,
              decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 240, 165, 165),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                        margin: const EdgeInsets.only(left: 10, top: 60),
                        text: bannerList[index]['title'],
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        size: 30),
                    CommonText(
                        margin: const EdgeInsets.only(left: 10),
                        text: bannerList[index]['subtitle'],
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        size: 15),
                    ArrowButton(
                      margin: EdgeInsets.only(left: 10, top: 10,bottom: 10),
                      text: 'Shop Now',
                      textColor: Colors.white,
                      widths: width * 0.32,
                      backgroundcolors: Colors.transparent,
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
