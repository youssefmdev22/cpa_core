import 'package:cpa_core/responsive/size_config.dart';
import 'package:flutter/material.dart';

double getResponsiveText(BuildContext context, {required double fontSize}) {
  final double scaleFactor = getScaleFactor(context);
  final double responsiveFontSize = scaleFactor * fontSize;
  final double lowerLimit = fontSize * .8;
  final double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  final double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.mobileWidth) {
    return width / 600;
  } else if (width < SizeConfig.desktopWidth) {
    return width / 850;
  } else {
    return width / 1200;
  }
}

extension ResponsiveFontSize on TextStyle {
  TextStyle responsiveFont(BuildContext context, {required double fontSize}) {
    return copyWith(fontSize: getResponsiveText(context, fontSize: fontSize));
  }
}