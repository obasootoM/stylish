import 'package:flutter/material.dart';
import 'package:stylish/%20model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/const/const.dart';
import 'package:stylish/const/error_handling.dart';
import 'package:stylish/utilis/util.dart';

class Service {
  void signUp(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      User user =
          User(id: '', name: name, email: email, password: password, type: '',token: '');
      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8'
          },
          body: user.toJson());
     HttpResponseService(
          context: context,
          response: res,
          success: () {
            showSnackBar(context, "Account is created, you can now Login");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
