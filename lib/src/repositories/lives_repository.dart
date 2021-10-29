import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bp_app/src/services/models/lives.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {}

class LivesRepository {
  final client = ClientMock();
  void loadData() {
    when(() => client.get(Uri.parse('/')))
        .thenAnswer((invocation) async => http.Response(data, 200));
  }

  Future<List<LivesModel>> fetchLives() async {
    loadData();
    final response = await client.get(Uri.parse('/'));
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      List<LivesModel> lives = [];
      for (var json in list) {
        final live = LivesModel.fromJson(json);
        lives.add(live);
      }
      return lives;
    } else {
      throw Exception('Network Error!');
    }
  }
}

const data =
    '[{"link": "https://www.youtube.com/embed/EEP1fZVUj84", "image": "assets/images/live1.png"}, {"link": "https://www.youtube.com/embed/GKdwTZ8JzlM", "image": "assets/images/live2.png"}, {"link": "https://www.youtube.com/embed/IjnVRejY_l4", "image": "assets/images/live3.png"}, {"link": "https://www.youtube.com/embed/OfrbP8RkETY", "image": "assets/images/live4.png"}, {"link": "https://www.youtube.com/embed/8ozIrnl8AO0", "image": "assets/images/live5.png"}, {"link": "https://www.youtube.com/embed/8ozIrnl8AO0", "image": "assets/images/live6.png"}]';
