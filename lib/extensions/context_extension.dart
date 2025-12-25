import 'package:flutter/material.dart';

extension Screensizeextension on BuildContext {
  double get screenwidth => MediaQuery.of(this).size.width;
  double get screenheight => MediaQuery.of(this).size.height;
  double wp(double percent) => screenwidth * percent / 100;
  double hp(double percent) => screenheight * percent / 100;
}
