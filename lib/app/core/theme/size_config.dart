// coverage:ignore-file
import 'package:flutter/material.dart';

mixin SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static const double originalDesignWidth = 390;
  static const double originalDesignHeight = 844;
  static double scaleWidth = 1.0;
  static double scaleHeight = 1.0;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    scaleWidth = screenWidth / originalDesignWidth;
    scaleHeight = screenHeight / originalDesignHeight;
  }
}
