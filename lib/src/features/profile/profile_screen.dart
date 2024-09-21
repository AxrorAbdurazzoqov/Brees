import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/features/auth/presentation/page/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUpScreen()), (_) => false);
          },
          child: Text(
            'Sign Out',
            style: FontStyleConst.instance.text32px,
          ),
        ),
      ),
    );
  }
}
