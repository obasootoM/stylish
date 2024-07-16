import 'package:flutter/material.dart';
class CommonButton extends StatelessWidget {
  const CommonButton({super.key, 
  required this.text, 
  required this.color, 
  required this.fontWeight, 
  this.width = 100, 
  required this.fontsize, 
  required this.onTap, 
  required this.background});
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double width;
  final double fontsize;
  final VoidCallback onTap;
  final Color background;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.07,
        width: width,
        decoration: ShapeDecoration(
          color: background,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child:  Center(child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: color
            ))),
      ),
    );
  }
}
