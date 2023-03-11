import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ohsundosun/data/provider/api_provider.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/model/request/auth/sign_in_request.dart';
import 'package:ohsundosun/model/response/common/base_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
Future<BaseResponse> signIn(
  SignInRef ref, {
  SignInType type = SignInType.main,
  required String email,
  required String password,
}) async {
  try {
    final authApi = ref.watch(authApiProvider);

    return await authApi.signIn(
      SignInRequest(
        type: type,
        email: email,
        password: password,
      ),
    );
  } on DioError catch (e) {
    final errorResponse = e.response;

    if (errorResponse != null) {
      final response = BaseResponse.fromJson(errorResponse.data, (json) => null);
      return Future.error(response.message);
    } else {
      return Future.error("error");
    }
  } catch (e) {
    return Future.error("error");
  }
}
