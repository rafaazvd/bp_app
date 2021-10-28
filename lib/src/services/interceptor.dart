import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'mock_interceptor.dart';

main() {
  _common();
}

void _common() {
  main.registerSingleton(
    (c) => Dio(BaseOptions(
      baseUrl: Environment.current.baseUrl,
    ))
      ..interceptors.addAll(c.resolve()),
  );
}

void _commonDevelopment() {
  main.registerInstance<Iterable<Interceptor>, List<Interceptor>>(
    <Interceptor>[
      MockInterceptor(),
    ],
  );
}

void _commonProduction() {
  main.registerInstance<Iterable<Interceptor>, List<Interceptor>>(
    <Interceptor>[],
  );
}
