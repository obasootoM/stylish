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
        : GridView.builder(
            scrollDirection: Axis.horizontal,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            shrinkWrap: true,
            physics: widget.physics,
            itemCount: _product!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 1,
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
                      RatingBars(star: star)
                    ],
                  ),
                ),
              );
            },
          );
  }
}
