import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userName = 'Guest';

  void updateUserName(String name) {
    userName = name;
    notifyListeners();
  }
}
