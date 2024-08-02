import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';

class PurchaseDetailedScreen extends StatefulWidget {
  static const routeName = 'purchase-detail';
  const PurchaseDetailedScreen({super.key, required this.product});
  final Product product;

  @override
  State<PurchaseDetailedScreen> createState() => _PurchaseDetailedScreenState();
}

class _PurchaseDetailedScreenState extends State<PurchaseDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
