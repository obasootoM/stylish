import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/loading.dart';
import 'package:stylish/features/category_screen/service/service.dart';

import '../../admin/widget/admin_container.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});
  final String category;
  @override
  State<CategoryScreen> createState() => _CategoryScreeState();
}

class _CategoryScreeState extends State<CategoryScreen> {
  final Service _service = Service();
  List<Product>? _product;

  void initState() {
    super.initState();
    fetchCategory();
  }

  void fetchCategory() async {
    _product = await _service.getProductCategory(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: CommonText(
            text: widget.category,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            size: 20),
      ),
      body: _product == null
          ? const ConstLoading()
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    'keep shopping  for ${widget.category}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                      itemCount: _product!.length,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 0.78,
                        mainAxisSpacing: 0.1,
                      ),
                      itemBuilder: (context, index) {
                        final product = _product![index];
                        return Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 10, ),
                          width: width * 0.5,
                          child: Card(
                            elevation: 2.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: width * 0.5,
                                    height: height * 0.15,
                                    child: AdminContainer(
                                        image: product.images[0]),
                                  ),
                                ),
                                CommonText(
                                  margin: EdgeInsets.only(left: 10),
                                    text: product.title,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    size: 15)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
