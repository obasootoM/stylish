import 'package:flutter/material.dart';
class CommonText extends StatelessWidget {
  const CommonText(
      {super.key,
      required this.text,
      required this.fontWeight,
      required this.color, 
      required this.size, this.margin});
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double size;
  final EdgeInsets? margin;
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
        fontWeight: fontWeight),
      ),
    );
  }
}
