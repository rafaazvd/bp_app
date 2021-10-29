import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bp_app/src/services/models/documentaries.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {}

class DocumentariesRepository {
  final client = ClientMock();
  void loadData() {
    when(() => client.get(Uri.parse('/')))
        .thenAnswer((invocation) async => http.Response(data, 200));
  }

  Future<List<DocumentariesModel>> fetchDocumentaries() async {
    loadData();
    final response = await client.get(Uri.parse('/'));
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      List<DocumentariesModel> docs = [];
      for (var json in list) {
        final doc = DocumentariesModel.fromJson(json);
        docs.add(doc);
      }
      return docs;
    } else {
      throw Exception('Network Error!');
    }
  }
}

const data =
    '[{"link": "https://www.youtube.com/embed/Ue77esm5Kqs", "image": "assets/images/doc1.png"}, {"link": "https://www.youtube.com/embed/xg2aGnmrND0", "image": "assets/images/doc2.png"}, {"link": "https://www.youtube.com/embed/UPDjFGGN2w0", "image": "assets/images/doc3.png"}, {"link": "https://www.youtube.com/embed/zOPY4xDDTis", "image": "assets/images/doc4.png"}, {"link": "https://www.youtube.com/embed/Ue77esm5Kqs", "image": "assets/images/doc5.png"}, {"link": "https://www.youtube.com/embed/YP5Wap-WWYA", "image": "assets/images/doc6.png"}, {"link": "https://www.youtube.com/embed/Ue77esm5Kqs", "image": "assets/images/doc7.png"}, {"link": "https://www.youtube.com/embed/ukx0OlFancQ", "image": "assets/images/doc8.png"}, {"link": "https://www.youtube.com/embed/xdRCQr352bA", "image": "assets/images/doc9.png"}, {"link": "https://www.youtube.com/embed/hPTlsV2lmBw", "image": "assets/images/doc10.png"}, {"link": "https://www.youtube.com/embed/dadsluy_IDc", "image": "assets/images/doc11.png"}, {"link": "https://www.youtube.com/embed/8kn4mFP3uUY", "image": "assets/images/doc12.png"}, {"link": "https://www.youtube.com/embed/K9ehE0S1IwA", "image": "assets/images/doc13.png"}, {"link": "https://www.youtube.com/embed/yTenWQHRPIg", "image": "assets/images/doc14.png"}, {"link": "https://www.youtube.com/embed/EOdcJ7JuiXk", "image": "assets/images/doc15.png"}]';
