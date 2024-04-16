import 'package:bab_el_ezz/shared_utils/styles/size_config.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle styleRegular20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle styleRegular10(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
  static TextStyle styleRegular8(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }
  static TextStyle styleExtraBold15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle styleExtraBold13(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle styleExtraBold17(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle styleLight13(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w300,
    );
  }
  static TextStyle styleLight18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
  static TextStyle styleSemiBold14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle styleSemiBold12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle styleSemiBold15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleRegular13(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle styleExtraBold20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w800,
    );
  }
  static TextStyle styleExtraBold16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle styleBold13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }
  static TextStyle styleBold15(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,

    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
  }
}


double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}