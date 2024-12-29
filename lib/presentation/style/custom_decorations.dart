import 'package:flutter/material.dart';
import 'package:stock_market_app/gen/colors.gen.dart';

abstract class CustomDecorations {
  static BoxDecoration customBorderedDecoration() => BoxDecoration(
        color: ColorName.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorName.primaryDark,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19184655),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      );
}
