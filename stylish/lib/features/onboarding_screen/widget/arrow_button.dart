import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton(
      {super.key,
      required this.text,
      required this.textColor,
      this.widths = 100,
      required this.backgroundcolors,
      required this.margin});
  final String text;
  final Color textColor;
  final Color backgroundcolors;
  final EdgeInsets margin;
  final double widths;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: margin,
      width: widths,//width * 0.32
      height: height * 0.05,
      decoration: BoxDecoration(
        color: backgroundcolors,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.5, color: Colors.white),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CommonText(
            text: text,
            fontWeight: FontWeight.normal,
            color: textColor,
            size: 15),
        const Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
        )
      ]),
    );
  }
}
