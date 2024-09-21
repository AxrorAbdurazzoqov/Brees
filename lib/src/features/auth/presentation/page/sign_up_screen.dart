import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/extensions/custom_snackbar.dart';
import 'package:brees/src/core/widgets/custom_elevated_buttom.dart';
import 'package:brees/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:brees/src/features/auth/presentation/page/login_screen.dart';
import 'package:brees/src/features/auth/presentation/page/welcome_screen.dart';
import 'package:brees/src/features/auth/presentation/widgets/user_agreement_widget.dart';
import 'package:brees/src/features/auth/presentation/widgets/user_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Sign Up', style: FontStyleConst.instance.text24px.copyWith(fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text('Welcome To Brees', style: FontStyleConst.instance.text24px.copyWith(fontSize: 29, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text('Complete the sign up to get started', style: FontStyleConst.instance.text18px),
              Form(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: UserInputs(
                    nameController: _nameController,
                    emilController: _emailController,
                    passwordController: _passwordController,
                  ),
                ),
              ),
              const UserAgreementWidget(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    title: 'Login',
                    height: 50,
                    color: AppColors.instance.blue.withOpacity(0.1).value,
                    textColor: AppColors.instance.blue.value,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                  ),
                  CustomElevatedButton(
                    title: 'Register',
                    height: 62,
                    width: 186,
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              RegisterEvent(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                onSuccess: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen())),
                                onFailure: () => context.showCustomSnackBar(color: AppColors.instance.redAccent, title: 'Failed to create account'),
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
