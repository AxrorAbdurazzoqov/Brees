import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NextWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const NextWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          AppVectors.instance.chevronRight,
        ),
      ),
    );
  }
}