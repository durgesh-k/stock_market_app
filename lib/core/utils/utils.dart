import 'package:flutter/material.dart';
import 'package:stock_market_app/core/utils/size_config.dart';

abstract class Utils {
  static GlobalKey<ScaffoldMessengerState> navigatorKey =
      GlobalKey<ScaffoldMessengerState>();

  static unfocusOnFocusChanged(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static initializeSizeConfig(BuildContext context) {
    SizeConfig.initialize(context);
  }

  static addHorizontalSpace(double val) {
    return SizedBox(width: val);
  }

  static addVerticalSpace(double val) {
    return SizedBox(height: val);
  }
}
