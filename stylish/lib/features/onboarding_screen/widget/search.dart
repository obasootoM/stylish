import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/loading.dart';
import 'package:stylish/features/search_screen/server/search_service.dart';

class Search extends SearchDelegate {
  final SearchService _service = SearchService();
  List<Product>? _product = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  Future fetchProduct(BuildContext context) async {
    _product = await _service.searchProduct(context, query);
  }

  @override
  Widget buildResults(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return _product == null
        ? const ConstLoading()
        : Container(child: ListView.builder(
          itemCount: _product!.length,
          itemBuilder: (context, index) {
            final product = _product![index];
            return ListTile(
              leading: Container(
                width: width * 0.3,
                height: height * 0.1,
                decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: Image.network(product.images[0]),
              ),
            );
          }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('search'),
    );
  }
}
