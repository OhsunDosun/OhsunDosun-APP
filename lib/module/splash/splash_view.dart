import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/data/service/auth_service.dart';
import 'package:ohsundosun/provider/router_provider.dart';

// class SplashView extends ConsumerWidget {
//   const SplashView({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     return Scaffold(body: Container());
//   }
// }

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    final authService = ref.read(authServiceProvider);

    authService.signCheck().then((value) {
      debugPrint(value.toString());
      context.go(AppRoute.main);
      FlutterNativeSplash.remove();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      context.go(AppRoute.onboard);
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    // We can also use "ref" to listen to a provider inside the build method
    // final counter = ref.watch(counterProvider);
    return Scaffold(body: Container());
  }
}
