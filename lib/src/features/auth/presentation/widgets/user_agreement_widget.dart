import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAgreementWidget extends StatelessWidget {
  const UserAgreementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isAgree = false;
    return Row(
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Checkbox(
              value: isAgree,
              side: BorderSide(color: AppColors.instance.blue, width: 2),
              focusColor: AppColors.instance.blue,
              onChanged: (value) {
                value = value ?? false;
                isAgree = !isAgree;
                context.read<AuthBloc>().add(UserAgreementEvent());
              },
            );
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'By signing up, you agree to the ',
              style: FontStyleConst.instance.text14px,
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms of Service and Privacy Policy',
                  style: FontStyleConst.instance.text14px.copyWith(color: AppColors.instance.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
