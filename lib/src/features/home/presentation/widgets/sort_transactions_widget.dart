import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/features/home/presentation/widgets/next_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SortTransactionsWidget extends StatelessWidget {
  const SortTransactionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.instance.darkBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.instance.discount),
          Text.rich(
            TextSpan(
              text: 'Sort your transactions\n',
              style: FontStyleConst.instance.whiteText14px,
              children: <InlineSpan>[
                TextSpan(
                  text: 'Get points for sorting your\ntransactions',
                  style: FontStyleConst.instance.whiteText14px.copyWith(
                    fontSize: 12,
                    color: AppColors.instance.white.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(),
          NextWidget(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}