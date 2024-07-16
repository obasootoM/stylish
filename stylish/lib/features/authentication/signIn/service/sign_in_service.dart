import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/const/error_handling.dart';
import 'package:stylish/features/admin/screen/admin_screen.dart';
import 'package:stylish/features/unsplash_screen/unsplash_screen.dart';
import 'package:stylish/provider/provider.dart';
import 'package:stylish/utilis/util.dart';

class Service {
  void signin(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/signin"),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode({"email": email, "password": password}));

      HttpResponseService(
          response: res,
          context: context,
          success: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<AuthProvider>(context, listen: false).setUser(res.body);
            await pref.setString("x-auth-token", jsonDecode(res.body)["token"]);
            print(res.body);
            if (Provider.of<AuthProvider>(context, listen: false).user.type ==
                'user') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UnsplashScreen()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminScreen()));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  getUserData({required BuildContext context}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');
      if (token == null) {
        pref.setString('x-auth-token', '');
      }
      var res = await http.post(Uri.parse('$uri/tokenIsVerified'),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(res.body);
      if (response == true) {
        http.Response userResponse = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'content-type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<AuthProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
