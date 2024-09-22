import 'package:brees/src/features/auth/presentation/page/verification_link_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/extensions/get_mediaquery_size.dart';
import 'package:brees/src/core/widgets/custom_elevated_buttom.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomElevatedButton(
                    title: 'Next',
                    height: 31,
                    color: AppColors.instance.white.withOpacity(0.15).value,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationLinkScreen()));
                    },
                  ),
                ),
                Text('Get Started', style: FontStyleConst.instance.whiteText24px),
                Text('Get most out of your Brees account', style: FontStyleConst.instance.whiteText14px),
                const SizedBox(height: 35),
                SizedBox(
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: 4,
                        separatorBuilder: (context, index) => const SizedBox(height: 24),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 124,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.instance.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: SizedBox(
                                    width: context.getWidth * 0.7,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(state.data[index].title, style: FontStyleConst.instance.whiteText18px),
                                        const SizedBox(height: 8),
                                        Text(
                                          maxLines: 2,
                                          state.data[index].desctiption,
                                          style: FontStyleConst.instance.whiteText14px,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -10,
                                  bottom: -5,
                                  height: 90,
                                  child: Image.asset(
                                    state.data[index].image,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
