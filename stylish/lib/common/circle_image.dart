import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key, required this.image, 
  required this.onTap});
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    // final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(

          child: Center(child: Image.asset(image)),
        )
        // Container(
        //   width: width * 0.15,
        //   height: height * 0.07,
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //           width: 1, style: BorderStyle.solid, color: Colors.red),
        //       color: Colors.grey[200],
        //       borderRadius: BorderRadius.circular(50)),
        //   child: Center(child: Image.asset(image)),
        // ),
      ),
    );
  }
}
