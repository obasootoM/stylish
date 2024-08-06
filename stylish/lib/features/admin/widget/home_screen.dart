import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/loading.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:stylish/features/admin/widget/add_product.dart';
import 'package:stylish/features/admin/widget/admin_container.dart';
import 'package:stylish/utilis/refresh.dart';
import '../../../const/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  void deleteProduct(Product product, int index) {
    _service.deleteProduct(
        context: context,
        product: product,
        callback: () {
          _product!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        leading: Text(''),
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
            margin: const EdgeInsets.only(right: 20),
            child: const CommonText(
                text: 'Admin',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                size: 20),
          )
        ],
      ),
      body: _product == null
          ? const Refresh()
          : GridView.builder(
              shrinkWrap: true,
              itemCount: _product!.length,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.83,
                  crossAxisSpacing: 0.1),
              itemBuilder: (context, index) {
                final product = _product![index];
                return Container(
                  margin: const EdgeInsets.only(left: 15, top: 15, right: 10),
                  width: width * 0.5,
                  child: Card(
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: width * 0.5,
                            child: AdminContainer(image: product.images[0]),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                                margin: const EdgeInsets.only(left: 10),
                                text: product.title,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                size: 15),
                            IconButton(
                                onPressed: () {
                                  deleteProduct(product, index);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton.small(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        tooltip: 'Add Product',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddProduct()));
        },
        enableFeedback: true,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
