import 'package:bp_app/src/repositories/courses_repository.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = CoursesRepository();
  test('Deve trazer uma lista de cursos de CoursesModel', () async {
    final listCourses = await repository.fetchCourses();
    expect(listCourses[0].link, "www.bp.com");
  });
}
