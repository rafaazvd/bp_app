import 'dart:io';

import 'package:bp_app/src/controllers/webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: WebViewControllers.instance,
        builder: (context, child) {
          return WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: WebViewControllers.instance.link,
          );
        });
  }
}
