import 'package:flutter/widgets.dart';
import 'package:stock_market_app/gen/colors.gen.dart';

abstract class TextStyles {
  static TextStyle boldMedium() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static TextStyle boldMediumLight() => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: ColorName.text);

  static TextStyle boldSmallLight() => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: ColorName.text);

  static TextStyle heading() => const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: ColorName.text);
}
