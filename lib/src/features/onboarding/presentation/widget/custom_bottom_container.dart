import 'package:brees/src/core/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/extensions/get_mediaquery_size.dart';
import 'package:brees/src/features/auth/presentation/page/sign_up_screen.dart';
import 'package:brees/src/features/onboarding/presentation/bloc/bloc/onboarding_bloc.dart';
import 'package:brees/src/features/onboarding/presentation/model/onboarding_model.dart';

class CustomBottomContainer extends StatelessWidget {
  final OnboardingModel state;
  final int index;

  const CustomBottomContainer({
    super.key,
    required this.state,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 23),
      height: context.getHeight * 0.425,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.instance.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 10,
            color: AppColors.instance.black.withOpacity(0.2),
          )
        ],
        borderRadius: BorderRadius.circular(48),
      ),
      child: Column(
        children: [
          Text(
            state.title,
            style: FontStyleConst.instance.text24px.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            state.description,
            style: FontStyleConst.instance.text18px,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          CustomElevatedButton(
            onPressed: () {
              context.read<OnboardingBloc>().add(
                    OnIndexChangedEvent(
                      currentIndex: index + 1,
                      onSuccess: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUpScreen()), (_) => false),
                    ),
                  );
            },
            height: 62,
            width: 207,
            title: index < 2 ? 'Next' : 'Get Started',
          ),
        ],
      ),
    );
  }
}

