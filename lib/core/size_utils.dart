import 'package:flutter/cupertino.dart';

///This method is used to set padding responsively
// EdgeInsetsGeometry getPadding({
//   double? all,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
// }) {
//   return getMarginOrPadding(
//     all: all,
//     left: left,
//     top: top,
//     right: right,
//     bottom: bottom,
//   );
// }

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeH;
  static double? blockSizeV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;

    blockSizeH = screenWidth! / 200;
    blockSizeV = screenHeight! / 200;
  }
}

double getResponsiveScreenWidth(inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 100) * screenWidth;
}

double getResponsiveScreenHeight(inputWidth) {
  double? screenHeight = SizeConfig.screenHeight;
  return (inputWidth / 100) * screenHeight;
}

Widget buildWidthSpace(double? space) {
  var sizeW = SizeConfig.blockSizeH;
  return SizedBox(
    width: sizeW! * space!,
  );
}

Widget buildHeightSpace(double? space) {
  var sizeH = SizeConfig.blockSizeV;
  return SizedBox(
    height: sizeH! * space!,
  );
}
