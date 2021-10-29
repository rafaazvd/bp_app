import 'package:bp_app/src/repositories/courses_repository.dart';
import 'package:bp_app/src/services/models/courses.dart';
import 'package:flutter/material.dart';

class getCourses extends StatefulWidget {
  const getCourses({Key? key}) : super(key: key);
  @override
  State<getCourses> createState() {
    return getCoursesState();
  }
}

class getCoursesState extends State<getCourses> {
  final coursesRepository = CoursesRepository();

  List<Widget> itemsData = [];

  void getPostsData() async {
    List<CoursesModel> responseList = await coursesRepository.fetchCourses();
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(
        TextButton(
          onPressed: () {
            print(post.link);
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
