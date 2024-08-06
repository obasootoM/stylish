import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      this.line,
      required this.fontWeight, this.color});
  final String text;
  final double size;
  final FontWeight fontWeight;
  final int? line;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 190),
      margin: const EdgeInsets.only(top: 17, left: 10),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Cera-Pro',
            color: color,
            fontSize: size,
            fontStyle: FontStyle.normal,
            overflow: TextOverflow.ellipsis,
            fontWeight: fontWeight),
        overflow: TextOverflow.ellipsis,
        maxLines: line,
      ),
    );
  }
}
