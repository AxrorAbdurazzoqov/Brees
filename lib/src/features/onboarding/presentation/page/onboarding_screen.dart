import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/extensions/get_mediaquery_size.dart';
import 'package:brees/src/features/auth/presentation/page/sign_up_screen.dart';
import 'package:brees/src/features/onboarding/presentation/bloc/bloc/onboarding_bloc.dart';
import 'package:brees/src/features/onboarding/presentation/widget/custom_bottom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<OnboardingBloc>().add(
                              OnSkippedEvent(
                                onSuccess: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUpScreen()), (_) => false),
                              ),
                            );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.instance.white.withOpacity(0.5),
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: FontStyleConst.instance.text18px.copyWith(color: AppColors.instance.white),
                      ),
                    ),
                  ),
                  Image.asset(
                    state.data[state.index].image,
                    height: context.getHeight * 0.4,
                  ),
                  CustomBottomContainer(
                    index: state.index,
                    state: state.data[state.index],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
