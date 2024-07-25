import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/loading.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/admin/service/service.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final Service _service = Service();
  List<Product>? _product;

  void initState() {
    getProduct();
    super.initState();
  }
   Future<void> liquidRefresh() async {
    return await Future.delayed(const Duration(seconds: 3));
  }
  void getProduct() async {
    _product = await _service.getProduct(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return  _product == null
        ? const ConstLoading()
        : LiquidPullToRefresh(
          onRefresh: liquidRefresh,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _product!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.73,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0.5),
              itemBuilder: (context, index) {
                final product = _product![index];
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 15),
                  width: width * 0.5,
                  child: Card(
                  surfaceTintColor: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: width * 0.5,
                            height: height * 0.2,
                            color: Colors.grey,
                            child: Image.network(
                              product.images[0],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        CommonText(
                            margin: const EdgeInsets.only(
                              left: 10,
                            ),
                            text: product.title,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            size: 15),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                           product.description,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        CommonText(
                          margin: const EdgeInsets.only(left: 10),
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          size: 15,
                          text: '\$${product.price}',
                        ),
                         const RatingBars(star: 0.0)
                      ],
                    ),
                  ),
                );
              },
            ),
        );
  }
  }