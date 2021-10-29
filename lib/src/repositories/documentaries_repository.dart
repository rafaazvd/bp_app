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
    '[{"link": "www.bp.com", "image": "assets/images/doc1.png"}, {"link": "www.bp.com", "image": "assets/images/doc2.png"}, {"link": "www.bp.com", "image": "assets/images/doc3.png"}, {"link": "www.bp.com", "image": "assets/images/doc4.png"}, {"link": "www.bp.com", "image": "assets/images/doc5.png"}, {"link": "www.bp.com", "image": "assets/images/doc6.png"}, {"link": "www.bp.com", "image": "assets/images/doc7.png"}, {"link": "www.bp.com", "image": "assets/images/doc8.png"}, {"link": "www.bp.com", "image": "assets/images/doc9.png"}, {"link": "www.bp.com", "image": "assets/images/doc10.png"}, {"link": "www.bp.com", "image": "assets/images/doc11.png"}, {"link": "www.bp.com", "image": "assets/images/doc12.png"}, {"link": "www.bp.com", "image": "assets/images/doc13.png"}, {"link": "www.bp.com", "image": "assets/images/doc14.png"}, {"link": "www.bp.com", "image": "assets/images/doc15.png"}]';
