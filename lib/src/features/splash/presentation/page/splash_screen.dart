import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/features/navbar/presentation/page/navbar.dart';
import 'package:brees/src/features/onboarding/presentation/page/onboarding_screen.dart';
import 'package:brees/src/features/splash/presentation/bloc/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(
          CheckUserEvent(
            onRegistered: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Navbar())),
            onUnregistered: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen())),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.primary,
      body: Center(
        child: Text(
          'Brees',
          style: FontStyleConst.instance.text32px.copyWith(fontSize: 67.77, fontWeight: FontWeight.bold, color: AppColors.instance.white),
        ),
      ),
    );
  }
}
