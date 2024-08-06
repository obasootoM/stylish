import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/const/error_handling.dart';
import 'package:stylish/provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/utilis/util.dart';

class DetailService {
  void productRating(
      {required BuildContext context,
      required Product product,
      required double rating}) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    try {
      http.Response res = await http.post(Uri.parse('$uri/add/product/rating'),
          headers: <String, String>{
            'content-type': 'Application/json; charset=UTF-8',
            'token': provider.user.token
          },
          body: jsonEncode({'id': product.id, 'rating': rating}));
      HttpResponseService(response: res, context: context, success: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
