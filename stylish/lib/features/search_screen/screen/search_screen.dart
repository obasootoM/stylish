import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:stylish/features/onboarding_screen/widget/search.dart';
import 'package:stylish/features/search_screen/widget/search_container.dart';

import 'package:stylish/features/onboarding_screen/widget/small_container.dart';

import '../../onboarding_screen/widget/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? _product;
  final Service _service = Service();

  void initState() {
    super.initState();
    fetchCategory();
  }

  void fetchCategory() async {
    _product = await _service.getProduct(context);
    setState(() {});
  }

  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
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
      body: Container(
        height: height * 1,
        width: width * 1,
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SearchBars(
              focusNode: _focusNode,
              onTap: () {
                showSearch(context: context, delegate: Search());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                    margin: EdgeInsets.only(left: 20),
                    text: '${_product?.length}+ items',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    size: 20),
                Row(
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
              height: 10,
            ),
            const SearchContainer()
          ]),
        ),
      ),
    );
  }
}
