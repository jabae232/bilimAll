import 'package:bilim_all/constants/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../account_screen/account_screen.dart';
import '../featured_screen/ui/featured_screen.dart';
import '../learning_screen/learning_screen.dart';
import '../search_screen/search_screen.dart';
import '../wishlist_screen/wishlist_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;
  void onSelectTab(int index) {
    if (_selectedTab == index) {

    }
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.selectedIconColor,
          unselectedItemColor: AppColors.unselectedIconColor,
          elevation: 15,
          backgroundColor: AppColors.defaultBackground,
          currentIndex: _selectedTab,
          onTap: onSelectTab,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.svg.featured,
                  color: _selectedTab == 0
                      ? AppColors.selectedIconColor
                      : AppColors.unselectedIconColor,
                    width: 25,height: 25
                ),
                label: 'Featured',),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.svg.search,
                    color: _selectedTab == 1
                        ? AppColors.selectedIconColor
                        : AppColors.unselectedIconColor,width: 25,height: 25),
                label: 'Ara'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.svg.learning,
                    color: _selectedTab == 2
                        ? AppColors.selectedIconColor
                        : AppColors.unselectedIconColor,width: 25,height: 25,),
                label: 'My learning'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.svg.wishlist,
                    color: _selectedTab == 3
                        ? AppColors.selectedIconColor
                        : AppColors.unselectedIconColor),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.svg.account,
                    color: _selectedTab == 4
                        ? AppColors.selectedIconColor
                        : AppColors.unselectedIconColor,width: 25,height: 25),
                label: 'Account'),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          FeaturedScreen(),
          SearchScreen(),
          LearningScreen(),
          WishlistScreen(),
          AccountScreen(),
        ],
      ),
    );
  }
}
