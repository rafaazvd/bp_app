import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bp_app/src/services/models/podcasts.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {}

class PodcastsRepository {
  final client = ClientMock();
  void loadData() {
    when(() => client.get(Uri.parse('/')))
        .thenAnswer((invocation) async => http.Response(data, 200));
  }

  Future<List<PodcastsModel>> fetchPodcasts() async {
    loadData();
    final response = await client.get(Uri.parse('/'));
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      List<PodcastsModel> pods = [];
      for (var json in list) {
        final pod = PodcastsModel.fromJson(json);
        pods.add(pod);
      }
      return pods;
    } else {
      throw Exception('Network Error!');
    }
  }
}

const data =
    '[{"link": "www.bp.com", "image": "assets/images/pod1.png"}, {"link": "www.bp.com", "image": "assets/images/pod2.png"}, {"link": "www.bp.com", "image": "assets/images/pod3.png"}, {"link": "www.bp.com", "image": "assets/images/pod4.png"}, {"link": "www.bp.com", "image": "assets/images/pod5.png"}, {"link": "www.bp.com", "image": "assets/images/pod6.png"}]';
