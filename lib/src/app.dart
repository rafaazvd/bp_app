import 'package:bp_app/src/controllers/login_controller.dart';
import 'package:bp_app/src/pages/Courses/courses.dart';
import 'package:bp_app/src/pages/Documentaries/documentaries.dart';
import 'package:bp_app/src/pages/Home/home.dart';
import 'package:bp_app/src/pages/HomePatriots/home.dart';
import 'package:bp_app/src/pages/HomePremium/home.dart';
import 'package:bp_app/src/pages/Lives/lives.dart';
import 'package:bp_app/src/pages/Login/login.dart';
import 'package:bp_app/src/pages/Podcasts/podcasts.dart';
import 'package:bp_app/src/pages/WebView/webview.dart';
import 'package:flutter/material.dart';

class AppBp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: LoginController.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              brightness: Brightness.dark,
            ),
            initialRoute: '/home_anonymous',
            routes: {
              '/login': (context) => LoginPage(),
              '/home_premium': (context) => HomePagePremium(
                    username: LoginController.instance.username,
                  ),
              '/home_patron': (context) => HomePagePremium(
                    username: LoginController.instance.username,
                  ),
              '/home_patriots': (context) => HomePagePatriots(
                    username: LoginController.instance.username,
                  ),
              '/home_anonymous': (context) => HomePage(
                    username: LoginController.instance.username,
                  ),
              '/courses': (context) => CoursesPage(
                    username: LoginController.instance.username,
                    type: LoginController.instance.type,
                  ),
              '/lives': (context) => LivesPage(
                    username: LoginController.instance.username,
                  ),
              '/podcasts': (context) => PodcastsPage(
                    username: LoginController.instance.username,
                  ),
              '/documentaries': (context) => DocumentariesPage(
                    username: LoginController.instance.username,
                  ),
              '/screen': (context) => WebViewPage(
                    username: LoginController.instance.username,
                    type: LoginController.instance.type,
                  ),
            },
          );
        });
  }
}
