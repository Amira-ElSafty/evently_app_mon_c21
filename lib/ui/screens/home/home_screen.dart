import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_routes.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/favorite/favorite_tab.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/home/home_tab.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabsList = [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          _builtBottomNavigationItem(
            selectedIcon: Icon(Icons.home_rounded),
            unSelectedIcon: Icon(Icons.home_outlined),
            isSelected: selectedIndex == 0,
            label: AppLocalizations.of(context)!.home,
          ),
          _builtBottomNavigationItem(
            selectedIcon: Icon(Icons.favorite),
            unSelectedIcon: Icon(Icons.favorite_border_outlined),
            isSelected: selectedIndex == 1,
            label: AppLocalizations.of(context)!.favorite,
          ),
          _builtBottomNavigationItem(
            selectedIcon: Icon(Icons.person),
            unSelectedIcon: Icon(Icons.person_2_outlined),
            isSelected: selectedIndex == 2,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: tabsList[selectedIndex],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: navigate to add event screen
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 25),
      ),
    );
  }

  BottomNavigationBarItem _builtBottomNavigationItem({
    required Widget selectedIcon,
    required Widget unSelectedIcon,
    required bool isSelected,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected ? selectedIcon : unSelectedIcon,
      label: label,
    );
  }
}
