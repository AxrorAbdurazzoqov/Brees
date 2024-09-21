import 'package:brees/src/core/utils/app_validators.dart';
import 'package:brees/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class UserInputs extends StatelessWidget {
  const UserInputs({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emilController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _emailController = emilController,
        _passwordController = passwordController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: _nameController,
          hinText: 'Name',
          validator: AppValidators.instance.name,
        ),
        const SizedBox(height: 16),
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
    );
  }
}
