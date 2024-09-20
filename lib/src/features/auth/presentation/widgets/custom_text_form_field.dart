import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hinText,
    this.isSecured = false,
    this.textInputAction = TextInputAction.next,
    this.validator,
  });

  final TextEditingController controller;
  final String hinText;
  final bool isSecured;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isSecured;

  @override
  void initState() {
    super.initState();
    isSecured = widget.isSecured;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecured,
      style: FontStyleConst.instance.text24px,
      controller: widget.controller,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.instance.white,
        labelText: widget.hinText,
        suffixIcon: widget.isSecured
            ? IconButton(
                onPressed: () {
                  isSecured = !isSecured;
                  setState(() {});
                },
                icon: SvgPicture.asset(
                  height: 24,
                  isSecured? AppVectors.instance.eyeOff: AppVectors.instance.eye,
                  colorFilter: ColorFilter.mode(AppColors.instance.blue, BlendMode.srcIn),
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        hintStyle: FontStyleConst.instance.text24px.copyWith(fontWeight: FontWeight.w200),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.instance.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.instance.greenAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.instance.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.instance.redAccent),
        ),
      ),
    );
  }
}
