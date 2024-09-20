import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:flutter/material.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){}, child: )
              Text('Get Started', style: FontStyleConst.instance.text24px),
              Text('Get most out of your Brees account', style: FontStyleConst.instance.text14px),
            ],
          ),
        ),
      ),
    );
  }
}
