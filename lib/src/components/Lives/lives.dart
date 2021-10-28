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
  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = lives_data;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(
        TextButton(
          onPressed: () {
            print(post["link"]);
          },
          child: SizedBox(
            width: 110,
            height: 150,
            child: Image.asset(post["image"]),
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
