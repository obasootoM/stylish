import 'package:flutter/material.dart';
import 'package:stylish/%20model/user_model.dart';

class AuthProvider extends ChangeNotifier {
  User _user = User(id:'',email: '', name: '', password: '', type: '',token: '');

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
