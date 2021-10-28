import 'package:bp_app/src/pages/Courses/courses.dart';
import 'package:bp_app/src/pages/Documentaries/documentaries.dart';
import 'package:bp_app/src/pages/Home/home.dart';
import 'package:bp_app/src/pages/Lives/lives.dart';
import 'package:bp_app/src/pages/Login/login.dart';
import 'package:bp_app/src/pages/Podcasts/podcasts.dart';
import 'package:flutter/material.dart';

class AppBp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/courses': (context) => CoursesPage(),
        '/lives': (context) => LivesPage(),
        '/podcasts': (context) => PodcastsPage(),
        '/documentaries': (context) => DocumentariesPage(),
      },
    );
  }
}
