import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
class Email extends _$Email {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

@riverpod
class Password extends _$Password {
  @override
  String build() => "";

  void update(String value) {
    state = value;
  }
}

Future<void> onSignIn(
  BuildContext context,
  WidgetRef ref, {
  required String email,
  required String password,
}) async {
  final loading = ref.read(loadingProvider.notifier);

  try {
    loading.update(true);

    final authService = ref.watch(authServiceProvider);

    await authService.signIn(
      email: email,
      password: password,
    );

    ref.read(routerProvider).go(AppRoute.main);

    loading.update(false);
  } catch (e) {
    loading.update(false);
  }
}
