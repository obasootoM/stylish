import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/cached_network_image.dart';
import 'package:stylish/common/custom_text.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/cart/screen/add_to_cart_screen.dart';

class PurchaseDetailedScreen extends StatefulWidget {
  static const routeName = 'detail-screen';
  final Product product;
  const PurchaseDetailedScreen({super.key, required this.product});

  @override
  State<PurchaseDetailedScreen> createState() => _PurchaseDetailedScreenState();
}

class _PurchaseDetailedScreenState extends State<PurchaseDetailedScreen> {
  void navigateToAddToCart() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddToCart(
                  product: widget.product,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(),
        body: InkWell(
          onTap: navigateToAddToCart,
          child: Container(
            height: height * 0.3,
            width: width * 1,
            child: Card(
              margin: const EdgeInsets.only( left: 10, right: 10),
              elevation: 2.0,
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedImages(
                      height: height * 0.3,
                      width: width * 0.45,
                      product: widget.product),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.product.title,
                      size: 20,
                      fontWeight: FontWeight.bold,
                      margin: const EdgeInsets.only(left: 5),
                    ),
                   CustomText(
                      text: widget.product.description,
                      size: 20,
                      fontWeight: FontWeight.normal,
                      style: FontStyle.italic,
                      margin: const EdgeInsets.only(left: 5),
                    ),
                   
                    const RatingBars(
                      margin: EdgeInsets.only(left: 5),
                      star: 0.0,
                      size: 20,
                    )
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
