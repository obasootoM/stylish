
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../ model/product.dart';

class CachedImages extends StatelessWidget {
  const CachedImages(
      {super.key, 
      required this.product, 
      this.width = 100, 
      this.height = 100});

  final Product product;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: product.images[0],
      imageBuilder: (context, imageprovider) {
        return Container(
            width: width,
            //widget.width, //width * 0.45
            height: height,
            //widget.height, //height * 0.2
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageprovider, fit: BoxFit.fill)));
      },
    );
  }
}
