import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/cached_network_image.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:stylish/features/cart/screen/add_to_cart_screen.dart';
import 'package:stylish/features/puchase_detailed_screen/screen/purchase_detailed_screen.dart';


class WishListScreen extends StatefulWidget {
  static const routeName = 'wish-list';
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final Service _service = Service();
  List<Product>? _product;

  void initState() {
    super.initState();
    _getService();
  }

  void _getService() async {
    _product = await _service.getProduct(context);
  }
 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Autocomplete<Product>(
                    optionsBuilder: (TextEditingValue value) {
                      if (value.text.isEmpty) {
                        return List.empty();
                      }
                      return _product!
                          .where((element) => element.title
                              .toLowerCase()
                              .contains(value.text.toLowerCase()))
                          .toList();
                    },
                    fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            Function onFieldSubmitted) =>
                        Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      child: TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                            hintText: 'search...',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white,width: 0.3)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 0.3)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 0.3))),
                      ),
                    ),
                    optionsViewBuilder: (BuildContext context, Function onSelected,
                        Iterable<Product> options) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Material(
                          type: MaterialType.canvas,
                          color: Colors.white,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                            childAspectRatio: 0.8,
                        crossAxisSpacing: 0.1
                            ),
          
                            itemCount: options.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Product product = options.elementAt(index);
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PurchaseDetailedScreen.routeName,
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
                                            constraints:
                                                const BoxConstraints(maxWidth: 200),
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
                                          const RatingBars(star: 0.0)
                                        ],
                                      )),
                                ),
                              );
                            },
                            
                          ),
                        ),
                      );
                    },
                    onSelected: (value) => print(value.title),
                    displayStringForOption: (Product pro) => '${pro.title}',
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
