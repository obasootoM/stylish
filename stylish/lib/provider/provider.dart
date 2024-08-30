import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/%20model/user_model.dart';

class AuthProvider extends ChangeNotifier {
  User _user = User(
      id: '', email: '', name: '', password: '', type: '', token: '', cart: []);
  Product _product = Product(
      title: '',
      description: '',
      quantity: 0,
      category: '',
      price: 0,
      id: '',
      images: []);
  Product get product => _product;
  User get user => _user;
  void setProduct(String product) {
    _product = Product.fromJson(product);
    notifyListeners();
  }

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setProductModel(Product product) {
    _product = product;
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
