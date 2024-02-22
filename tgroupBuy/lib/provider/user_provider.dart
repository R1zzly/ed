import 'package:flutter/material.dart';
import 'package:tgroupbuy/data/models/User.dart';

class UserProvider extends ChangeNotifier {
  User _user = User.empty();
  User get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}