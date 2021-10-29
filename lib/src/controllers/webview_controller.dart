import 'package:flutter/material.dart';

class WebViewControllers extends ChangeNotifier {
  static WebViewControllers instance = WebViewControllers();
  String link = 'anonymous';
  changeLink(text) {
    link = text;
    notifyListeners();
  }
}
