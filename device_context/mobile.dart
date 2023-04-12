import 'package:flutter/material.dart';

class MobileDimension {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static bool isMobile(BuildContext context) => screenWidth(context) < 768;
}
