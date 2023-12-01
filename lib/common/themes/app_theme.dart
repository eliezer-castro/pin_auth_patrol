import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  textTheme: TextTheme(
    displayLarge: AppTextStyles.headline1(color: AppColors.textOnPrimary),
    bodyLarge: AppTextStyles.bodyText1(color: AppColors.textOnPrimary),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary),
);
