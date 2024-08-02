import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/loading.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/admin/service/service.dart';
import '../../../ model/product.dart';

class ProductContainer extends StatefulWidget {
  const ProductContainer({super.key, this.physics});
  final ScrollPhysics? physics;
  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
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

  double star = 0.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return _product == null
        ?  const ConstLoading()
        :  Container(
          height: height * 0.31,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _product!.length,
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
                          Expanded(child: RatingBars(star: star))
                        ],
                      ),
                    ),
                  );
                },
          ),
        );
  }
}
