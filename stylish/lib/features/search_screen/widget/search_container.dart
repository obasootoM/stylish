import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/cached_network_image.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/admin/service/service.dart';

import 'package:stylish/utilis/shimmer_effect.dart';

import '../../puchase_detailed_screen/screen/purchase_detailed_screen.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key, required this.search});
  final String search;

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final Service _service = Service();
  List<Product>? _product;

  void initState() {
    searchProduct();
    super.initState();
  }

  Future<void> liquidRefresh() async {
    return await Future.delayed(const Duration(seconds: 3));
  }

  void searchProduct() async {
    _product = await _service.getProduct(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return _product == null
        ? const ShimmerEffect()
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 0.1),
            itemCount: _product!.length,
            itemBuilder: (context, index) {
              final product = _product![index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PurchaseDetailedScreen.routeName,
                      arguments: product);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  width: width * 0.5,
                  child: Card(
                      surfaceTintColor: Colors.white,
                      shadowColor: Colors.black,
                      elevation: 3.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedImages(
                                product: product,
                                width: width * 0.45,
                                height: height * 0.17,
                              )),
                          CommonText(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              text: product.title,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              size: 20),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 200),
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              product.description,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          CommonText(
                            margin: const EdgeInsets.only(left: 10),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            size: 15,
                            text: '\$${product.price}',
                          ),
                          const RatingBars(
                            margin: EdgeInsets.only(left: 10),
                            star: 0.0)
                        ],
                      )),
                ),
              );
            },
          );
  }
}
