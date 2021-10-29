import 'package:bp_app/src/controllers/webview_controller.dart';
import 'package:bp_app/src/repositories/podcasts_repository.dart';
import 'package:bp_app/src/services/models/podcasts.dart';
import 'package:flutter/material.dart';

class getPodcasts extends StatefulWidget {
  const getPodcasts({Key? key}) : super(key: key);
  @override
  State<getPodcasts> createState() {
    return getPodcastsState();
  }
}

class getPodcastsState extends State<getPodcasts> {
  final repository = PodcastsRepository();
  List<Widget> itemsData = [];

  void getPostsData() async {
    List<PodcastsModel> responseList = await repository.fetchPodcasts();
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
