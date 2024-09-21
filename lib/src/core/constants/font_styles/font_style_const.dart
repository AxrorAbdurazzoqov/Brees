import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class FontStyleConst {
  
  static final FontStyleConst _instance = FontStyleConst.init();
  static FontStyleConst get instance => _instance;
  FontStyleConst.init();

  final TextStyle text14px = const TextStyle(fontSize: 14, fontFamily: 'Inter');
  final TextStyle text18px = const TextStyle(fontSize: 18, fontFamily: 'Inter');
  final TextStyle text24px = const TextStyle(fontSize: 24, fontFamily: 'Inter');
  final TextStyle text32px = const TextStyle(fontSize: 32, fontFamily: 'Inter');

  final TextStyle whiteText14px = TextStyle(fontSize: 14, fontFamily: 'Inter', color: AppColors.instance.white);
  final TextStyle whiteText18px = TextStyle(fontSize: 18, fontFamily: 'Inter', color: AppColors.instance.white);
  final TextStyle whiteText24px = TextStyle(fontSize: 24, fontFamily: 'Inter', color: AppColors.instance.white);
  final TextStyle whiteText32px = TextStyle(fontSize: 32, fontFamily: 'Inter', color: AppColors.instance.white);
}