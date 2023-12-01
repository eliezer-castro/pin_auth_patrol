// text_styles.dart
import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';

class AppTextStyles {
  static const String _fontName = 'Inter';

  static TextStyle headline1({Color color = AppColors.textOnPrimary}) {
    return TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.bold,
      fontSize: 32.0,
      color: color,
    );
  }

  static TextStyle headline2({Color color = AppColors.textOnPrimary}) {
    return TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      color: color,
    );
  }

  static TextStyle bodyText1({Color color = AppColors.textOnPrimary}) {
    return TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
      color: color,
    );
  }

  static TextStyle bodyText2({Color color = AppColors.textOnPrimary}) {
    return TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      color: color,
    );
  }

  static TextStyle button({Color color = Colors.white}) {
    return TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.w600, // Semibold
      fontSize: 16.0,
      color: color,
    );
  }

  static TextStyle caption({Color color = AppColors.textOnPrimary}) {
    return TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
      color: color,
    );
  }
}
