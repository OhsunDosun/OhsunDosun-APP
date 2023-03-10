import 'package:flutter_dotenv/flutter_dotenv.dart';

class FlavorConfig {
  final String baseUrl;
  final String appKey;

  static late final FlavorConfig instance;

  FlavorConfig._dev()
      : baseUrl = dotenv.get("DEV_BASE_URL"),
        appKey = dotenv.get("DEV_APP_KEY");

  FlavorConfig._prod()
      : baseUrl = dotenv.get("PROD_BASE_URL"),
        appKey = dotenv.get("PROD_APP_KEY");

  factory FlavorConfig(String flavor) {
    if (flavor == "dev") {
      instance = FlavorConfig._dev();
    } else {
      instance = FlavorConfig._prod();
    }

    return instance;
  }
}
