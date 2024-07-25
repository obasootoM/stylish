import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';


class SmallContainer extends StatelessWidget {
  const SmallContainer({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: width * 0.14,
      height: height * 0.03,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonText(
              text: text,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              size: 10),
          Image.asset(image)
        ],
      ),
    );
  }
}
