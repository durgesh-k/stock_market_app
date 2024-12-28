import 'package:flutter/material.dart';

abstract class SizeConfig {
  static double width = 0;
  static double height = 0;
  static Size size = Size(width, height);

  static void initialize(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }
}
