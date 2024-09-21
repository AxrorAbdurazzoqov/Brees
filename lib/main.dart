import 'package:brees/firebase_options.dart';
import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:brees/src/features/navbar/presentation/bloc/navbar_bloc.dart';
import 'package:brees/src/features/onboarding/presentation/bloc/bloc/onboarding_bloc.dart';
import 'package:brees/src/features/splash/presentation/bloc/bloc/splash_bloc.dart';
import 'package:brees/src/features/splash/presentation/page/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => NavbarBloc()),
      ],
      child: const Brees(),
    ),
  );
}

class Brees extends StatelessWidget {
  const Brees({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brees',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.instance.primary),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
