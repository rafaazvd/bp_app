import 'package:bp_app/src/pages/Courses/courses.dart';
import 'package:bp_app/src/pages/Documentaries/documentaries.dart';
import 'package:bp_app/src/pages/Home/home.dart';
import 'package:bp_app/src/pages/HomePremium/home.dart';
import 'package:bp_app/src/pages/Lives/lives.dart';
import 'package:bp_app/src/pages/Login/login.dart';
import 'package:bp_app/src/pages/Podcasts/podcasts.dart';
import 'package:flutter/material.dart';

class AppBp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPage(),
        '/home_premium': (context) => HomePagePremium(
              username: 'arguments.username',
            ),
        '/home': (context) => const HomePage(
              username: 'Anônimo',
            ),
        '/courses': (context) => CoursesPage(),
        '/lives': (context) => LivesPage(),
        '/podcasts': (context) => PodcastsPage(),
        '/documentaries': (context) => DocumentariesPage(),
      },
    );
  }
}
