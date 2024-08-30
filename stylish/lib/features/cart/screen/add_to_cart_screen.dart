import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:badges/badges.dart' as badges;
import 'package:stylish/provider/provider.dart';

import '../../../ model/product.dart';

class AddToCart extends StatefulWidget {
  static const routName = 'add-to-cart';
  final Product product;
  const AddToCart({
    super.key,
    required this.product,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final Service _service = Service();
  List<Product>? _product;
  List<File> images = [];
  int currentPage = 0;
  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.product.images.length; i++)
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: i == currentPage ? 7 : 5,
            width: i == currentPage ? 7 : 5,
            decoration: BoxDecoration(
                color: i == currentPage ? Colors.black : Colors.grey,
                shape: BoxShape.circle),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<AuthProvider>(context).user.cart.length;
  
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {},
              icon: badges.Badge(
                  badgeContent: Text(provider.toString()),
                  child: Image.asset(ConstImage.cart)))
        ],
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          width: width * 1,
          height: height * 0.2,
          // decoration: ShapeDecoration(
          //     color: Colors.grey,
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CarouselSlider(
                items: widget.product.images.map((e) {
                  return Builder(
                      builder: (context) => Image.network(
                            e.toString(),
                            fit: BoxFit.fill,
                            width: 400,
                          ));
                }).toList(),
                options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(milliseconds: 1000),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value, _) {
                      currentPage = value;
                    })),
          ),
        ),
       
        buildCarouselIndicator(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ]),
    );
  }
}


