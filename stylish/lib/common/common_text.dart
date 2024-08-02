import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {super.key,
      required this.text,
      required this.fontWeight,
      required this.color,
      required this.size,
      this.textDecoration,
      this.margin,
      this.fontStyle});
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double size;
  final EdgeInsets? margin;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Inter',
            color: color,
            fontSize: size,
            fontStyle: fontStyle,
            decoration: textDecoration,
            overflow: TextOverflow.ellipsis,
            fontWeight: fontWeight),
      ),
    );
  }
}
