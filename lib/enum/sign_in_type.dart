import 'package:freezed_annotation/freezed_annotation.dart';

enum SignInType {
  @JsonValue("DEFAULT")
  main,
  @JsonValue("NEW_PASSWORD")
  newPassword;
}
