import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_market_app/gen/colors.gen.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: ColorName.primary,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      appBarTheme: const AppBarTheme(
          backgroundColor: ColorName.background,
          iconTheme: IconThemeData(color: ColorName.text)),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white, surfaceTint: Colors.transparent),
      fontFamily: GoogleFonts.inter().fontFamily,
      bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.white,
          backgroundColor: ColorName.background,
          modalBackgroundColor: Colors.white),
      scaffoldBackgroundColor: ColorName.background,
      textTheme: const TextTheme().apply(decorationColor: ColorName.text),
      dialogBackgroundColor: Colors.white,
      tabBarTheme: const TabBarTheme(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab),
      backgroundColor: Colors.white,
      useMaterial3: true,
    );
