import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/extensions/custom_snackbar.dart';
import 'package:brees/src/core/utils/app_validators.dart';
import 'package:brees/src/core/widgets/custom_elevated_buttom.dart';
import 'package:brees/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:brees/src/features/auth/presentation/page/sign_up_screen.dart';
import 'package:brees/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:brees/src/features/navbar/presentation/page/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
          title: Text('Login', style: FontStyleConst.instance.text24px.copyWith(fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text('Welcome back', style: FontStyleConst.instance.text24px.copyWith(fontSize: 29, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text("Hey you're back, fill in your details to get back in", style: FontStyleConst.instance.text18px),
              Form(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _emailController,
                        hinText: 'Email',
                        validator: AppValidators.instance.email,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _passwordController,
                        hinText: 'Password',
                        isSecured: true,
                        textInputAction: TextInputAction.done,
                        validator: AppValidators.instance.password,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    if (_emailController.text.isNotEmpty && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
                      context.read<AuthBloc>().add(ResetPasswordEvent(email: _emailController.text));
                      context.showCustomSnackBar(color: AppColors.instance.primary, title: 'Check email to reset your password');
                    } else {
                      context.showCustomSnackBar(color: AppColors.instance.redAccent, title: 'Enter email address');
                    }
                  },
                  child: Text(
                    'Forgot Password?',
                    style: FontStyleConst.instance.text18px.copyWith(color: AppColors.instance.primary, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    title: 'Register',
                    height: 50,
                    color: AppColors.instance.primary.withOpacity(0.1).value,
                    textColor: AppColors.instance.primary.value,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                  ),
                  CustomElevatedButton(
                    title: 'Login',
                    height: 62,
                    width: 186,
                    onPressed: () {
                      if (_globalKey.currentState!.validate() && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                                onSuccess: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Navbar()), (_) => false),
                                onFailure: () => context.showCustomSnackBar(color: AppColors.instance.redAccent, title: 'Failed to Sign in'),
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
