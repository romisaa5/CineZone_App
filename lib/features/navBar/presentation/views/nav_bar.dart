import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/features/browse/presentation/views/browse_view.dart';
import 'package:cinezone_app/features/home/presentation/views/home_view.dart';
import 'package:cinezone_app/features/navBar/manager/cubit/nav_bar_cubit.dart';
import 'package:cinezone_app/features/profile/presentation/views/profile_view.dart';
import 'package:cinezone_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});
  static List<Widget> views = [
    const HomeView(),
    const BrowseView(),
    const SearchView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          if (state is NavBarChanged) {
            return views[state.index];
          }
          return views[0];
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: GNav(
          onTabChange: (index) {
            context.read<NavBarCubit>().changeIndex(index);
          },
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: Colors.black, width: 1),
          duration: Duration(milliseconds: 400),
          gap: 8,
          color: Colors.grey[800],
          activeColor: AppColors.yellowcolor,
          iconSize: 24,
          tabBackgroundColor: AppColors.yellowcolor.withValues(alpha: 0.1),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tabs: [
            GButton(icon: LineIcons.home, text: 'Home'),
            GButton(icon: LineIcons.thLarge, text: 'Browse'),
            GButton(icon: LineIcons.search, text: 'Search'),
            GButton(icon: LineIcons.user, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
