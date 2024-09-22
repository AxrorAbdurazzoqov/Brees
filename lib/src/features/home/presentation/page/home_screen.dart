import 'package:brees/src/core/constants/font_styles/font_style_const.dart';
import 'package:brees/src/features/home/data/model/data_model.dart';
import 'package:brees/src/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:brees/src/features/home/presentation/widgets/next_widget.dart';
import 'package:flutter/material.dart';
import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/features/home/presentation/widgets/balance_widget.dart';
import 'package:brees/src/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:brees/src/features/home/presentation/widgets/sort_transactions_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(UploadUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.primary,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final Account data = state.data!.account;

                if (state.status == HomeStatus.success) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      BalanceWidget(
                        data: state.data!.account,
                      ),
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
                            Text('${data.currency}${data.balance}', style: FontStyleConst.instance.whiteText18px.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                            const SizedBox(height: 10),
                            Text('Left out of ${data.currency}${data.balance - data.monthlySpentAmount} budgeted', style: FontStyleConst.instance.whiteText14px),
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
                                NextWidget(onPressed: () {}),
                              ],
                            ),
                            Column(
                              children: List.generate(
                                3,
                                (index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: AppColors.instance.backgroundColor,
                                  ),
                                  title: Text(data.transactions[index].description, style: FontStyleConst.instance.whiteText14px),
                                  subtitle: Text(
                                    data.transactions[index].date.toString(),
                                    style: FontStyleConst.instance.whiteText14px.copyWith(fontSize: 12, color: AppColors.instance.white.withOpacity(0.75)),
                                    maxLines: 1,
                                  ),
                                  trailing: Text("+${data.currency}${data.transactions[index].amount}", style: FontStyleConst.instance.whiteText14px),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.instance.greenAccent,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
