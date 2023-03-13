import 'package:dio/dio.dart';
import 'package:ohsundosun/data/api/auth_api.dart';
import 'package:ohsundosun/enum/sign_in_type.dart';
import 'package:ohsundosun/model/request/auth/sign_in_request.dart';
import 'package:ohsundosun/model/response/common/default_response.dart';

class AuthService {
  final AuthApi _authApi;

  AuthService(this._authApi);

  Future<DefaultResponse> signIn({
    SignInType type = SignInType.main,
    required String email,
    required String password,
  }) async {
    try {
      return await _authApi.signIn(
        SignInRequest(
          type: type,
          email: email,
          password: password,
        ),
      );
    } on DioError catch (e) {
      final errorResponse = e.response;

      if (errorResponse != null) {
        final response = DefaultResponse.fromJson(errorResponse.data);
        return Future.error(response.message);
      } else {
        return Future.error("error");
      }
    } catch (e) {
      return Future.error("error");
    }
  }

  Future<DefaultResponse> signCheck() async {
    try {
      return await _authApi.signCheck();
    } on DioError catch (e) {
      final errorResponse = e.response;

      if (errorResponse != null) {
        final response = DefaultResponse.fromJson(errorResponse.data);
        return Future.error(response.message);
      } else {
        return Future.error("error");
      }
    } catch (e) {
      return Future.error("error");
    }
  }
}
