import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/cached_network_image.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:stylish/features/puchase_detailed_screen/screen/purchase_detailed_screen.dart';
import 'package:stylish/features/search_screen/widget/search_container.dart';
import 'package:stylish/features/onboarding_screen/widget/small_container.dart';


class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  const SearchScreen({super.key, required this.search});
  final String search;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  List<Product>? _getService;
  final Service _service = Service();
  @override
  void initState() {
    super.initState();
    productList();
  }

  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void productList() async {
    _getService = await _service.getProduct(context);
  }

  Future<void> liquidRefresh() async {
    return await Future.delayed(const Duration(seconds: 3));
  }

  // void searchProduct() async {
  //   _product = await _searchService.searchProduct(context, widget.search);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
  
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(ConstImage.group336),
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            ConstImage.group34010,
            width: width * 0.15,
            height: height * 0.05,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            ConstImage.styliah2,
            width: width * 0.15,
            height: height * 0.05,
          ),
        ]),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar())
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Autocomplete<Product>(
              optionsBuilder: (TextEditingValue value) {
                if (value.text.isEmpty) {
                  return List.empty();
                }
                return _getService!
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                      hintText: 'search...',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 0.1),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                  margin: const EdgeInsets.only(left: 20),
                  text: '${_getService?.length}+ items',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  size: 20),
              const Row(
                children: [
                  SmallContainer(
                    text: 'sort',
                    image: ConstImage.component,
                  ),
                  SmallContainer(text: 'Filter', image: ConstImage.vector)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Visibility(child: SearchContainer(search: widget.search))
        ]),
      ),
      // body: Container(
      //   height: height * 1,
      //   width: width * 1,
      //   color: Colors.grey[100],
      //   child: SingleChildScrollView(
      //     child:
      //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           CommonText(
      //               margin: const EdgeInsets.only(left: 20),
      //               text: '${_product?.length}+ items',
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black,
      //               size: 20),
      //           const Row(
      //             children: [
      //               SmallContainer(
      //                 text: 'sort',
      //                 image: ConstImage.component,
      //               ),
      //               SmallContainer(text: 'Filter', image: ConstImage.vector)
      //             ],
      //           )
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Center(child: Text(widget.search),)
      //     ]),
      //   ),
      // ),
    );
  }
}
