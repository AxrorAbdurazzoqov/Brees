import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/core/extensions/get_mediaquery_size.dart';
import 'package:brees/src/features/home/data/model/data_model.dart';
import 'package:brees/src/features/home/presentation/widgets/next_widget.dart';
import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  final Account data;
  const BalanceWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.instance.darkBlue,
        image: DecorationImage(image: AssetImage(AppVectors.instance.pattern), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: context.getWidth * 0.1),
              Image.asset(
                height: 52,
                AppVectors.instance.avatar,
              ),
              NextWidget(
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'Your available balance is\n',
              style: FontStyleConst.instance.whiteText14px,
              children: <InlineSpan>[
                TextSpan(
                  text: '${data.currency}${data.balance}\n',
                  style: FontStyleConst.instance.whiteText32px.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'By this time last month, you spent\nslightly higher (${data.currency}${data.balance - data.monthlySpentAmount})',
                  style: FontStyleConst.instance.text14px,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.institutions[index].name,
                      style: FontStyleConst.instance.whiteText14px.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${data.currency}${data.institutions[index].amount}',
                      style: FontStyleConst.instance.whiteText14px.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
