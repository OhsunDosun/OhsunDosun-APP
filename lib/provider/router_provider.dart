import 'package:go_router/go_router.dart';
import 'package:ohsundosun/module/login/login_view.dart';
import 'package:ohsundosun/module/onboard/onboard_view.dart';
import 'package:ohsundosun/module/pwfind/pwfind_view.dart';
import 'package:ohsundosun/module/register/register_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

class AppRoute {
  AppRoute._();

  static const onboard = '/';
  static const login = '/login';
  static const register = '/register';
  static const pwfind = '/pwfind';

  static const main = '/main';

  static const init = AppRoute.onboard;

  static final routes = [
    GoRoute(
      path: AppRoute.onboard,
      builder: (context, state) => const OnboardView(),
      routes: [
        GoRoute(
          path: AppRoute.login.replaceFirst(AppRoute.onboard, ""),
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: AppRoute.register.replaceFirst(AppRoute.onboard, ""),
          builder: (context, state) => const RegisterView(),
        ),
        GoRoute(
          path: AppRoute.pwfind.replaceFirst(AppRoute.onboard, ""),
          builder: (context, state) => const PwfindView(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.main,
      builder: (context, state) => const RegisterView(),
    ),
  ];
}

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: AppRoute.init,
    routes: AppRoute.routes,
  );
}
