import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/cached_network_image.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/loading.dart';
import 'package:stylish/features/admin/service/service.dart';

class SubProductList extends StatefulWidget {
  const SubProductList({super.key});

  @override
  State<SubProductList> createState() => _SubProductListState();
}

class _SubProductListState extends State<SubProductList> {
  final Service _service = Service();
  List<Product>? _product;
  void initState() {
    getProduct();
    super.initState();
  }

  void getProduct() async {
    _product = await _service.getProduct(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return _product == null
        ? const ConstLoading()
        : Container(
            margin: EdgeInsets.only(top: 10),
            height: height * 0.3,
            child: ListView.builder(
              itemCount: _product!.length,
              shrinkWrap: true,
              primary: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = _product![index];
                return Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  width: width * 0.5,
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedImages(
                              product: product,
                              width: width * 0.5,
                              height: height * 0.2,
                            )),

                        ///width: width * 0.5,
                        // height: height * 0.2,
                        Expanded(
                          child: CommonText(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              text: product.title,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              size: 15),
                        ),
                        Expanded(
                          child: Container(
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
                        ),
                        Expanded(
                          child: CommonText(
                            margin: const EdgeInsets.only(left: 10),
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            size: 15,
                            text: '\$${product.price}',
                          ),
                        ),
                        Row(
                          children: [
                            CommonText(
                              margin: EdgeInsets.only(left: 10),
                              text: '\$999',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              size: 15,
                              textDecoration: TextDecoration.lineThrough,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CommonText(
                                text: '70% off',
                                fontWeight: FontWeight.normal,
                                color: Colors.red,
                                size: 15)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
