import 'package:ohsundosun/enum/sign_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_provider.g.dart';

@riverpod
class SignStatusProvider extends _$SignStatusProvider {
  @override
  SignStatus build() {
    return SignStatus.signOut;
  }

  void set(SignStatus status) {
    state = status;
  }
}
