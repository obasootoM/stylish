import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:stylish/%20model/onboarding_model.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/common/custom_text.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:badges/badges.dart' as badges;
import 'package:stylish/features/puchase_detailed_screen/service/product_detail_service.dart';
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
  final DetailService _dservice = DetailService();
  int choiceOption = 1;
  List<Product>? _product;
  List<File> images = [];
  int currentPage = 0;
  double minRating = 0;
  double aveRating = 0;
  @override
  void initState() {
    super.initState();
    double totalRate = 0.0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRate += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<AuthProvider>(context, listen: false).user.id) {
        minRating = widget.product.rating![i].rating;
      }
      if (totalRate != 0) {
        aveRating = widget.product.rating![i].rating;
      }
    }
  }

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        const SizedBox(
          height: 5,
        ),
        CommonText(
            margin: const EdgeInsets.only(left: 10),
            text: 'Size: ${choiceOption}',
            fontWeight: FontWeight.bold,
            color: Colors.black,
            size: 20),
        ChipsChoice.single(
          value: choiceOption,
          onChanged: (val) => setState(() => choiceOption = val),
          choiceItems: C2Choice.listFrom(
            source: choiceTag,
            value: (i, v) => i,
            label: (i, v) => v,
            //disabled: (i, v) => [0, 2, 5].contains(i)
          ),
          choiceStyle: C2ChoiceStyle(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.all(10),
            borderWidth: 5.0,
          ),
          wrapped: true,
          spacing: 3.0,
          padding: const EdgeInsets.all(10),
        ),
        CommonText(
            margin: const EdgeInsets.only(left: 10),
            text: widget.product.title,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            size: 27),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RatingBar.builder(
                  minRating: 1,
                  direction: Axis.horizontal,
                  initialRating: aveRating,
                  itemCount: 5,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemBuilder: (context, _) {
                    return const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 170, 59),
                    );
                  },
                  onRatingUpdate: (rating) {
                    _dservice.productRating(
                        context: context,
                        product: widget.product,
                        rating: rating);
                  }),
            ),
            const SizedBox(width: 20,),
            CustomText(
                text: '${widget.product.rating!.length.toString()}',
                size: 15,
                fontWeight: FontWeight.normal)
          ],
        ),
        const SizedBox(height: 20,),
        const CustomText(
          margin: EdgeInsets.only(left: 10),
          text: 'Product Details', size: 15, fontWeight: FontWeight.bold),
        CustomText(
          margin: const EdgeInsets.only(left: 10),
          text: widget.product.description, size: 15, fontWeight: FontWeight.normal)
      ]),
    );
  }
}
