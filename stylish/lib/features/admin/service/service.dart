import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/const/error_handling.dart';
import 'package:stylish/provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/utilis/util.dart';

class Service {
  void addProduct(
      {required BuildContext context,
      required String title,
      required String description,
      required String category,
      required double price,
      required double quantity,
      required List<File> images}) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);

    try {
      final cloudinary =
          CloudinaryPublic('dlem80kmx', 'anrq6yzh', cache: false);
      List<String> imageUrl = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: title));
        imageUrl.add(res.secureUrl);
      }
      // final cloudinary =
      //     CloudinaryPublic('dlem80kmx', 'anrq6yzh', cache: false);
      // List<String> imageUrl = [];
      // for (int i = 0; i < image.length; i++) {
      //   CloudinaryResponse res = await cloudinary
      //       .uploadFile(CloudinaryFile.fromFile(image[i].path, folder: title));
      //   imageUrl.add(res.secureUrl);
      // }
      Product product = Product(
          title: title,
          description: description,
          quantity: quantity,
          category: category,
          price: price,
          id: '',
          images: imageUrl);
      http.Response res = await http.post(Uri.parse('$uri/api/product'),
          body: product.toJson(),
          headers: <String, String>{
            'content-type': 'application/json;  charset=UTF-8',
            'x-auth-token': provider.user.token
          });

      HttpResponseService(
          response: res,
          context: context,
          success: () {
            showSnackBar(context, 'product added successfully');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> getProduct(BuildContext context) async {
    List<Product> _product = [];
    final provider = Provider.of<AuthProvider>(context, listen: false);
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/get-product'), headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
        'x-auth-token': provider.user.token
      });
      HttpResponseService(
          response: res,
          context: context,
          success: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              _product
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return _product;
  }

  void deleteProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback callback}) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    try {
      http.Response res =
          await http.delete(Uri.parse('$uri/api/delete-product'),
              headers: <String, String>{
                'content-type': 'application/json; charset=UTF-8',
                'x-auth-token': provider.user.token
              },
              body: jsonEncode({'id': product.id}));
      HttpResponseService(response: res, context: context, success: callback);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
