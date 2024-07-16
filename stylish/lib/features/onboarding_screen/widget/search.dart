import 'package:flutter/material.dart';
import 'package:stylish/features/onboarding_screen/widget/product_list.dart';




class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const ProductContainer(physics: AlwaysScrollableScrollPhysics(),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: const Text('search'));
  }
}
