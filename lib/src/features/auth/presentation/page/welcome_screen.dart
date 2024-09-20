import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/core/extensions/get_mediaquery_size.dart';
import 'package:brees/src/core/widgets/custom_elevated_buttom.dart';
import 'package:brees/src/features/auth/presentation/page/instruction_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;
  const WelcomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              height: 128.8,
              AppVectors.instance.tick,
            ),
            const SizedBox(height: 56),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'Hi!\t',
                style: FontStyleConst.instance.text32px,
                children: <InlineSpan>[
                  TextSpan(
                    text: username,
                    style: FontStyleConst.instance.text32px.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '\nWelcome To Brees',
                    style: FontStyleConst.instance.text32px,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.getHeight * 0.25),
            CustomElevatedButton(
              title: "Let's get started",
              height: 62,
              width: context.getWidth * 0.8,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InstructionScreen()));
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
