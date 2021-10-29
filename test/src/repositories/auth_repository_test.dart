import 'package:bp_app/src/repositories/auth_repository.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final data = {"email": "premium@mail.com", "password": "1234567"};
  final repository = AuthRepository();
  test('Deve Fazer Login na aplicacao', () async {
    final auth = await repository.fetchAuth(data);
    expect(auth[0].type, "premium");
  });
}
