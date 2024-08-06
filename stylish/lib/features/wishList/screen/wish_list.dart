import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/common/cached_network_image.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/rating.dart';
import 'package:stylish/features/admin/service/service.dart';
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
      body: ,
    );
  }
}
