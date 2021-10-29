import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bp_app/src/services/models/auth.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {}

class AuthRepository {
  // Object data = {};
  // AuthRepository(data) {
  //   print(data);
  //   this.data = data;
  // }

  final client = ClientMock();

  void testMeth(data) {
    when(() => client.post(Uri.parse('/login'), body: data))
        .thenAnswer((invocation) async => http.Response(dataResponse, 200));
  }

  Future<List<AuthModel>> fetchAuth(data) async {
    testMeth(data);
    final response = await client.post(Uri.parse('/login'), body: data);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      List<AuthModel> auths = [];
      for (var json in list) {
        final auth = AuthModel.fromJson(json);
        if (auth.email == data["email"] && auth.password == data["password"]) {
          auths.add(auth);
          return auths;
        }
      }
      return [] as List<AuthModel>;
    } else {
      throw Exception('Network Error!');
    }
  }
}

const dataResponse =
    '[{"token": "svn67gb8y8h7wc3nuhwcnhwn8hiaeuhcecc", "password": "1234567", "email": "premium@mail.com", "name": "user premium", "type": "premium"}, {"token": "svn67gb8y8h7wc3nuhwcnshwn8hiaeuhcecc", "password": "1234567", "email": "patriots@mail.com", "name": "user patriots", "type": "patriots"}]';
//   patriots, anonymous, premium, patron