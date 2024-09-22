import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/core/extensions/get_mediaquery_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: context.getWidth * 0.6,
      backgroundColor: AppColors.instance.primary,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text.rich(
          TextSpan(
            text: 'Hello ${FirebaseAuth.instance.currentUser!.displayName}\n',
            style: FontStyleConst.instance.whiteText18px.copyWith(fontWeight: FontWeight.bold),
            children: <InlineSpan>[
              TextSpan(
                text: 'Your finances are looking good',
                style: FontStyleConst.instance.whiteText14px.copyWith(fontWeight: FontWeight.w300, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: AppColors.instance.darkBlue,
            child: SvgPicture.asset(AppVectors.instance.bell),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: AppColors.instance.darkBlue,
            child: SvgPicture.asset(AppVectors.instance.search),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
