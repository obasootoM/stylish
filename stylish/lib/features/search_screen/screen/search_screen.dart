import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/const/loading.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:stylish/features/search_screen/server/search_service.dart';
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
  List<Product>? _product;
  final SearchService _searchService = SearchService();
  @override
  void initState() {
    super.initState();
    searchProduct();
  }

  void searchProduct() async {
    _product = await _searchService.searchProduct(context, widget.search);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Center(child: Text(widget.search)),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: Image.asset(ConstImage.group336),
      //   centerTitle: true,
      //   title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     Image.asset(
      //       ConstImage.group34010,
      //       width: width * 0.15,
      //       height: height * 0.05,
      //     ),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     Image.asset(
      //       ConstImage.styliah2,
      //       width: width * 0.15,
      //       height: height * 0.05,
      //     ),
      //   ]),
      //   actions: [
      //     Container(
      //         margin: const EdgeInsets.only(right: 10),
      //         child: const CircleAvatar())
      //   ],
      // ),
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
