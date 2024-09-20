import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.instance.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.instance.backgroundColor,
    ),
  );
}
