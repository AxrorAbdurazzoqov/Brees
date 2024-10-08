import 'package:flutter/material.dart';

class AppColors {
  static final _instance = AppColors.init();
  static AppColors get instance => _instance;
  AppColors.init();

  //! Colors

  final Color primary = const Color(0xff2C14DD);
  final Color blue =  const Color(0xff432DEC);
  final Color black = const Color(0xff000000);
  final Color white = const Color(0xffFFFFFF);
  final Color darkBlue = const Color(0xff2816A7);
  final Color redAccent = const Color(0xffFD3C4A);
  final Color greenAccent = const Color(0xff00A86B);
  final Color purpleAccent = const Color(0xff7F3DFF);
  final Color backgroundColor = const Color(0xffF5F7FF);
}
