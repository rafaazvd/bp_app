import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bp_app/src/services/models/courses.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {}

class CoursesRepository {
  final client = ClientMock();
  void testMeth() {
    when(() => client.get(Uri.parse('/')))
        .thenAnswer((invocation) async => http.Response(data, 200));
  }

  Future<List<CoursesModel>> fetchCourses() async {
    testMeth();
    final response = await client.get(Uri.parse('/'));
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      List<CoursesModel> courses = [];
      for (var json in list) {
        final course = CoursesModel.fromJson(json);
        courses.add(course);
      }
      return courses;
    } else {
      throw Exception('Network Error!');
    }
  }
}

const data =
    '[{"link": "www.bp.com", "image": "assets/images/curso1.png"}, {"link": "www.bp.com", "image": "assets/images/curso2.png"}, {"link": "www.bp.com", "image": "assets/images/curso3.png"}, {"link": "www.bp.com", "image": "assets/images/curso4.png"}, {"link": "www.bp.com", "image": "assets/images/curso5.png"}, {"link": "www.bp.com", "image": "assets/images/curso6.png"}, {"link": "www.bp.com", "image": "assets/images/curso7.png"}]';
