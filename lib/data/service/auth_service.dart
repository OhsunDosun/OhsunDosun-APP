import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ohsundosun/config/flavor_config.dart';
import 'package:ohsundosun/data/api/auth_api.dart';
import 'package:ohsundosun/data/service/storage_service.dart';

@lazySingleton
class AuthService {
  late final AuthApi _authApi;
  late final StorageService storageService;

  @factoryMethod
  static Future<AuthService> create(StorageService storageService) async {
    final service = AuthService();
    service.storageService = storageService;
    await service.init();
    return service;
  }

  init() async {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
      debugPrint('REQUEST[${options.method}] => PATH: ${options.data}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.data}');
      return handler.next(response);
    }, onError: (DioError e, handler) {
      debugPrint('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
      return handler.next(e);
    }));

    _authApi = AuthApi(dio, baseUrl: FlavorConfig.instance.baseUrl);
  }

  Future<void> signIn({
    required String phoneNo,
  }) async {
    try {} catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }
}
