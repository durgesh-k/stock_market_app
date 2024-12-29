import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stock_market_app/core/utils/secure_storage.dart';
import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/data/models/others/agora_creds_model.dart';

class Env {
  String token = "";
  String razorpayKey = "";

  getApp() async {
    await dotenv.load(fileName: ".env");
    if (appFlavor != null) {
      switch (appFlavor) {
        case "qa":
          token = dotenv.env['RAPID_API_KEY_QA'] ?? '';
          razorpayKey = dotenv.env['RAZORPAY_KEY_QA'] ?? '';
          break;
        case "dev":
          token = dotenv.env['RAPID_API_KEY_DEV'] ?? '';
          razorpayKey = dotenv.env['RAZORPAY_KEY_DEV'] ?? '';
          break;
        case "prod":
          token = dotenv.env['RAPID_API_KEY_PROD'] ?? '';
          razorpayKey = dotenv.env['RAZORPAY_KEY_PROD'] ?? '';
          break;
        default:
          token = dotenv.env['RAPID_API_KEY_DEV'] ?? '';
          razorpayKey = dotenv.env['RAZORPAY_KEY_DEV'] ?? '';
      }
    }
    SecureStorage.addStringToSF(ValueKeys.tokenKey, token);
    SecureStorage.addStringToSF(ValueKeys.razorpayKey, razorpayKey);
  }

  Future<AgoraCreds> getAgoraCreds() async {
    String agoraAppId = dotenv.env['AGORA_APP_ID'] ?? '';

    String agoraChannelId = Constants.agoraChannelId;
    String user = await SecureStorage.getStringFromSF(ValueKeys.user);
    String agoraToken = "";
    if (user.isNotEmpty && user == "Bob") {
      agoraToken = dotenv.env['BOB_AGORA_TOKEN'] ?? '';
    } else {
      agoraToken = dotenv.env['ALICE_AGORA_TOKEN'] ?? '';
    }
    return AgoraCreds(
        appId: agoraAppId, token: agoraToken, channelId: agoraChannelId);
  }
}

Env env = Env();
