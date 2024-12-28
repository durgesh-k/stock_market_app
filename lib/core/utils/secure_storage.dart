import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

abstract class SecureStorage {
  static AndroidOptions _androidOptions() => AndroidOptions();
  static IOSOptions _iosOptions() =>
      const IOSOptions(accessibility: IOSAccessibility.first_unlock);

  static addStringToSF(String key, String val) async {
    try {
      const storage = FlutterSecureStorage();

      await storage.write(
          key: key,
          value: val,
          aOptions: _androidOptions(),
          iOptions: _iosOptions());
      Logger().f("Added $val to $key in Secure Storage");
    } catch (e) {
      Logger().e(e);
    }
  }

  static Future<String> getStringFromSF(String key) async {
    try {
      const storage = FlutterSecureStorage();
      String? value = await storage.read(
          key: key, aOptions: _androidOptions(), iOptions: _iosOptions());
      Logger().f("$key has value $value in Secure Storage");
      return value ?? '';
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }
}
