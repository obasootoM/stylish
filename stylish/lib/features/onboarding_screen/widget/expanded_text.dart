import 'package:flutter/material.dart';

class ExpandedText extends StatelessWidget {
  const ExpandedText({super.key, required this.margin, required this.text, this.fontWeight, this.color});
  final EdgeInsets margin;
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(text,style: TextStyle(),),);
  }
}
