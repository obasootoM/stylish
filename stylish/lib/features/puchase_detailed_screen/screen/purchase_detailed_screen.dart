import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/custom_text.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/puchase_detailed_screen/widget/product_container.dart';

class PurchaseDetailedScreen extends StatelessWidget {
  static const routeName = 'purchase-detail';
  PurchaseDetailedScreen({super.key, required this.product});
  final Product product;

  int average = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
      ),
      body: InkWell(
        mouseCursor: MaterialStateMouseCursor.textable,
        highlightColor: Colors.yellow,
        focusColor: Colors.yellow,
        splashColor: Colors.blueGrey,
        onTap: () {},
        child: Container(
          width: width * 1,
          height: height * 0.3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ProductDetailContainer(widget: widget),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                      text: product.title,
                      size: 20,
                      fontWeight: FontWeight.bold),
                  const RatingBars(
                    star: 0.0,
                    size: 25,
                  ),
                  CustomText(
                    text: product.description,
                    size: 15,
                    fontWeight: FontWeight.normal,
                    line: 1,
                  ),
                  const CustomText(
                    text: 'In stock',
                    size: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                  CustomText(
                      text: "\$${product.price}",
                      size: 20,
                      fontWeight: FontWeight.bold),
                  const CustomText(
                      text: "Eligible for shipping",
                      size: 20,
                      fontWeight: FontWeight.bold),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
