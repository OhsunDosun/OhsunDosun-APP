import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio()
    ..options.headers["App-Key"] = ref.watch(appKeyProvider)
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      debugPrint('[${options.method}] ${options.path}');
      debugPrint('REQUEST');
      debugPrint('${options.data}');
      debugPrint('${options.headers["set-cookie"]}');
      debugPrint('____________________________________________');
      return handler.next(options);
    }, onResponse: (response, handler) {
      debugPrint('[${response.requestOptions.method}] ${response.requestOptions.path}');
      debugPrint('RESPONSE [${response.statusCode}]');
      debugPrint('${response.data}');
      debugPrint('${response.headers["set-cookie"]}');
      debugPrint('____________________________________________');
      return handler.next(response);
    }, onError: (DioError e, handler) {
      debugPrint('[${e.requestOptions.method}] ${e.requestOptions.path}');
      debugPrint('ERROR  [${e.response?.statusCode}]');
      debugPrint('${e.response?.data}');
      debugPrint('____________________________________________');
      return handler.next(e);
    }));
}
