import 'package:bp_app/src/repositories/courses_repository.dart';
import 'package:bp_app/src/repositories/documentaries_repository.dart';
import 'package:bp_app/src/repositories/lives_repository.dart';
import 'package:bp_app/src/repositories/podcasts_repository.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repositoryCourses = CoursesRepository();
  final repositoryDocumentaries = DocumentariesRepository();
  final repositoryLives = LivesRepository();
  final repositoryPodcasts = PodcastsRepository();
  test('should be able to get a list of Courses', () async {
    final listCourses = await repositoryCourses.fetchCourses();
    expect(listCourses[0].image, "assets/images/curso1.png");
  });
  test('should be able to get a list of Documentaries', () async {
    final listCourses = await repositoryDocumentaries.fetchDocumentaries();
    expect(listCourses[0].image, "assets/images/doc1.png");
  });
  test('should be able to get a list of Lives', () async {
    final listCourses = await repositoryLives.fetchLives();
    expect(listCourses[0].image, "assets/images/live1.png");
  });
  test('should be able to get a list of Podcasts', () async {
    final listCourses = await repositoryPodcasts.fetchPodcasts();
    expect(listCourses[0].image, "assets/images/pod1.png");
  });
}
