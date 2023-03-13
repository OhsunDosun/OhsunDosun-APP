import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ohsundosun/enum/app_mode.dart';
import 'package:ohsundosun/enum/sign_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_provider.g.dart';

@riverpod
AppMode appMode(AppModeRef ref) {
  return throw UnimplementedError();
}

@riverpod
String baseUrl(BaseUrlRef ref) {
  final appMode = ref.watch(appModeProvider);

  switch (appMode) {
    case AppMode.dev:
      return dotenv.get("DEV_BASE_URL");
    case AppMode.prod:
      return dotenv.get("PROD_BASE_URL");
  }
}

@riverpod
String appKey(AppKeyRef ref) {
  final appMode = ref.watch(appModeProvider);

  switch (appMode) {
    case AppMode.dev:
      return dotenv.get("DEV_APP_KEY");
    case AppMode.prod:
      return dotenv.get("PROD_APP_KEY");
  }
}

@riverpod
class AccessToken extends _$AccessToken {
  @override
  String? build() {
    return null;
  }

  void update(String? value) {
    state = value;
  }
}

@riverpod
class RefreshToken extends _$RefreshToken {
  @override
  String? build() {
    return null;
  }

  void update(String? value) {
    state = value;
  }
}

@riverpod
class Sign extends _$Sign {
  @override
  SignStatus build() {
    return SignStatus.signOut;
  }

  void update(SignStatus value) {
    state = value;
  }
}
