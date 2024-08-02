import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      width: width * 0.5,
      height: height * 0.3,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 3.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: width * 0.5,
                height: height * 0.2,
                color: Colors.grey,
                child: Image.asset(
                  ConstImage.maskGroup4,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: CommonText(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  text: 'product.titletttttttttttttttttttt',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  size: 15),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  'product.descriptionmmmmmmmmmmmmmmmmmmmmmm',
                  style: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            Expanded(
              child: CommonText(
                margin: const EdgeInsets.only(left: 10),
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                size: 15,
                text: '\$product.price',
              ),
            ),
            // Expanded(child: RatingBars(star: star))
          ],
        ),
      ),
    ));
  }
}
