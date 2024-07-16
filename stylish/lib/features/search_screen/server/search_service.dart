import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/const/error_handling.dart';
import 'package:stylish/provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/utilis/util.dart';

class SearchService {
  Future<List<Product>> searchProduct(
      BuildContext context, String query) async {
    List<Product> product = [];
    final provider = Provider.of<AuthProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
          Uri.parse('$uri/api/product/query/$query'),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
            'x-auth-token': provider.user.token
          });
      HttpResponseService(
          response: res,
          context: context,
          success: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              product
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return product;
  }
}
