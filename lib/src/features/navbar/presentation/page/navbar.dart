import 'package:brees/src/core/constants/colors/app_colors.dart';
import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/features/navbar/presentation/bloc/navbar_bloc.dart';
import 'package:brees/src/features/navbar/presentation/bloc/navbar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    NavbarBloc bloc = context.watch<NavbarBloc>();
    return Scaffold(
      body: bloc.state.screens[bloc.state.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bloc.state.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.instance.primary,
        onTap: (index) {
          bloc.add(OnNavbarIndexChangedEvent(index: index));
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppVectors.instance.home),
            activeIcon: SvgPicture.asset(AppVectors.instance.homeFilled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppVectors.instance.budget),
            activeIcon: SvgPicture.asset(AppVectors.instance.budgetFilled),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppVectors.instance.insight),
            activeIcon: SvgPicture.asset(AppVectors.instance.insightFilled),
            label: "Liked",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppVectors.instance.profile),
            activeIcon: SvgPicture.asset(AppVectors.instance.profileFilled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
