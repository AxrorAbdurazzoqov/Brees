import 'package:flutter/material.dart';
import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';

class CustomElevatedButton extends StatelessWidget {
  final int? color;
  final int? textColor;
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    this.color,
    this.textColor,
    required this.title,
    required this.height,
    required this.onPressed,
    this.width = double.infinity, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(width, height)),
        backgroundColor: WidgetStatePropertyAll(
          color == null ? AppColors.instance.blue : Color(color!),
        ),
      ),
      child: Text(
        title,
        style: FontStyleConst.instance.text18px.copyWith(color: textColor==null? AppColors.instance.white: Color(textColor!)),
      ),
    );
  }
}
