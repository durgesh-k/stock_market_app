import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stock_market_app/core/utils/secure_storage.dart';
import 'package:stock_market_app/data/constants.dart';

class Env {
  String token = "";

  getApp() async {
    await dotenv.load(fileName: ".env");
    if (appFlavor != null) {
      switch (appFlavor) {
        case "qa":
          token = dotenv.env['RAPID_API_KEY_QA'] ?? '';
          break;
        case "dev":
          token = dotenv.env['RAPID_API_KEY_DEV'] ?? '';
          break;
        case "prod":
          token = dotenv.env['RAPID_API_KEY_PROD'] ?? '';
          break;
        default:
          token = dotenv.env['RAPID_API_KEY_DEV'] ?? '';
      }
    }
    SecureStorage.addStringToSF(ValueKeys.tokenKey, token);
  }
}

Env env = Env();
