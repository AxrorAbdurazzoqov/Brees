import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/core/extensions/custom_snackbar.dart';
import 'package:brees/src/core/extensions/get_mediaquery_size.dart';
import 'package:brees/src/core/utils/firebase_auth_service.dart';
import 'package:brees/src/core/widgets/custom_elevated_buttom.dart';
import 'package:brees/src/features/navbar/presentation/page/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationLinkScreen extends StatefulWidget {
  const VerificationLinkScreen({super.key});

  @override
  State<VerificationLinkScreen> createState() => _VerificationLinkScreenState();
}

class _VerificationLinkScreenState extends State<VerificationLinkScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuthService.instance.signInVerificationLink(
      onSuccess: () => context.showCustomSnackBar(color: AppColors.instance.greenAccent, title: 'Successfully'),
      onFailure: () => context.showCustomSnackBar(color: AppColors.instance.redAccent, title: 'Something went Wrong'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                height: 256,
                width: 248,
                AppVectors.instance.mail,
              ),
              const SizedBox(height: 56),
              Text(
                'We have sent an email verification link to your email',
                textAlign: TextAlign.center,
                style: FontStyleConst.instance.text24px,
              ),
              const SizedBox(height: 16),
              Text(
                'Check your email ${FirebaseAuth.instance.currentUser!.displayName ?? ''} and click the link to verify your email address',
                textAlign: TextAlign.center,
                style: FontStyleConst.instance.text18px.copyWith(color: AppColors.instance.black.withOpacity(0.5)),
              ),
              SizedBox(height: context.getHeight * 0.1),
              CustomElevatedButton(
                title: "Continue",
                height: 62,
                width: context.getWidth * 0.8,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Navbar()), (_) => false);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
