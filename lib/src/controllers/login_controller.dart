import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  static LoginController instance = LoginController();
  String username = 'Faça Login';
  String type = 'anonymous';
  changeName(text) {
    username = text;
    notifyListeners();
  }

  changeType(text) {
    type = text;
    notifyListeners();
  }
}
