import 'package:bp_app/src/controllers/webview_controller.dart';
import 'package:bp_app/src/repositories/lives_repository.dart';
import 'package:bp_app/src/services/models/lives.dart';
import 'package:flutter/material.dart';

class getLives extends StatefulWidget {
  const getLives({Key? key}) : super(key: key);
  @override
  State<getLives> createState() {
    return getLivesState();
  }
}

class getLivesState extends State<getLives> {
  final repository = LivesRepository();
  List<Widget> itemsData = [];

  void getPostsData() async {
    List<LivesModel> responseList = await repository.fetchLives();
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(
        TextButton(
          onPressed: () {
            WebViewControllers.instance.changeLink(post.link);
            Navigator.of(context).pushNamed('/screen');
          },
          child: SizedBox(
            width: 110,
            height: 150,
            child: Image.asset(post.image as String),
          ),
        ),
      );
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    getPostsData();
    return Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: _screenSize.height * 0.15,
          child: ListView.builder(
            // controller: controller,
            itemCount: itemsData.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return itemsData[index];
            },
          ),
        )
      ],
    ));
  }
}
