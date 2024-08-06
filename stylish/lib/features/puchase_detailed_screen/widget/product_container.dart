import 'package:flutter/material.dart';
import 'package:stylish/common/cached_network_image.dart';
import 'package:stylish/features/puchase_detailed_screen/screen/purchase_detailed_screen.dart';

class ProductDetailContainer extends StatelessWidget {
  const ProductDetailContainer({
    super.key,
  
    required this.widget,
  });


  final PurchaseDetailedScreen widget;

  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(left: 5, top: 20),
      width: width * 0.5,
      height: height * 0.3,
      child: Card(
        elevation: 3.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedImages(
            width: width * 0.5,
            height: height * 0.3,
            product: widget.product,
          ),
        ),
      ),
    );
  }
}