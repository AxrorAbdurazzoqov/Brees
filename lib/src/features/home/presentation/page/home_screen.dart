import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/features/home/presentation/widgets/next_widget.dart';
import 'package:flutter/material.dart';
import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/features/home/presentation/widgets/balance_widget.dart';
import 'package:brees/src/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:brees/src/features/home/presentation/widgets/sort_transactions_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.primary,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const BalanceWidget(),
                const SortTransactionsWidget(),
                const SizedBox(height: 24),
                Text('My Budgets', style: FontStyleConst.instance.whiteText14px),
                const SizedBox(height: 16),
                Container(
                  height: 194,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.instance.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('You have', style: FontStyleConst.instance.whiteText14px),
                          NextWidget(
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text('N29,880', style: FontStyleConst.instance.whiteText18px.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                      const SizedBox(height: 10),
                      Text('Left out of N80,888 budgeted', style: FontStyleConst.instance.whiteText14px),
                      Slider(
                        activeColor: AppColors.instance.greenAccent,
                        thumbColor: Colors.transparent,
                        value: 0.4,
                        onChanged: (val) {},
                      ),
                      Text('😱  Sapa go soon catch you bros, calm down!!', style: FontStyleConst.instance.whiteText14px.copyWith(fontSize: 11)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text('Transactions', style: FontStyleConst.instance.whiteText14px),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.instance.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Recent Transactions', style: FontStyleConst.instance.whiteText14px),
                          NextWidget(
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(
                          3,
                          (index) => ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.instance.backgroundColor,
                            ),
                            title: Text('John Ogaga', style: FontStyleConst.instance.whiteText14px),
                            subtitle: Text(
                              'Zenith Bank 12:03 AM',
                              style: FontStyleConst.instance.whiteText14px.copyWith(fontSize: 12, color: AppColors.instance.white.withOpacity(0.75)),
                              maxLines: 1,
                            ),
                            trailing: Text('+N20,983', style: FontStyleConst.instance.whiteText14px),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
