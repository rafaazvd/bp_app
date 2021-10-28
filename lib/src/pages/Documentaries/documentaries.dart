import 'dart:ui';

import 'package:bp_app/src/components/Documentaries/documentaries.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DocumentariesPage extends StatefulWidget {
  const DocumentariesPage({Key? key}) : super(key: key);
  @override
  State<DocumentariesPage> createState() {
    return DocumentariesPageState();
  }
}

class DocumentariesPageState extends State<DocumentariesPage> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 64,
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.airplay),
                    title: Text('Documentário'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/documentaries');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contactless),
                    title: Text('Lives'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/lives');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.mic_rounded),
                    title: Text('Podcasts'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/podcasts');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.auto_stories),
                    title: Text('Cursos'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/courses');
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sair'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ),
                Container(
                  height: 64,
                ),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Jhon doe'),
        actions: [
          SizedBox(
            width: 44,
            height: 44,
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
      ),
      body: Column(
          // direction: Axis.vertical,
          children: [
            Expanded(
              // fit: FlexFit.loose,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height: _screenSize.height * 0.2,
                ),
                Text(
                  'Documentarios',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: _screenSize.height * 0.04,
                ),
                getDocumentaries(),
                Container(
                  height: _screenSize.height * 0.02,
                ),
              ]),
            ),
          ]),
    );
  }
}
