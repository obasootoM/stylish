import 'package:flutter/material.dart';

class AdminContainer extends StatelessWidget {
  const AdminContainer({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width * 0.5,
        height: height * 0.2,
        decoration: ShapeDecoration(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
                shadows: const [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: Colors.white
                  )
                ]
                ),
        child: Image.network(image, fit: BoxFit.fill,),
      ),
    );
  }
}
