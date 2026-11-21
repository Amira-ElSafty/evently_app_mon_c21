import 'package:evently_app_mon_c21/core/utils/app_assets.dart';
import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_routes.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/providers/app_theme_provider.dart';
import 'package:evently_app_mon_c21/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language/language_bottom_sheet.dart';
import 'theme/theme_bottom_sheet.dart';
import 'widgets/profile_item.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.04),
      child: Column(
        spacing: height * 0.02,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppAssets.logoRouteImage),
          ),
          Text(
            userProvider.currentUser!.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            userProvider.currentUser!.email,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: height * 0.01),
          ProfileItem(
            text: AppLocalizations.of(context)!.dark_mode,
            item: Switch(
              value: themeProvider.isDark,
              onChanged: (value) {
                themeProvider.changeTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
              activeTrackColor: Theme.of(context).primaryColor,
              activeThumbColor: AppColors.whiteColor,
              inactiveThumbColor: AppColors.whiteColor,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.transparentColor;
                }
                return AppColors.lightGreyColor; // Use the default color.
              }),
            ),
          ),
          ProfileItem(
            text: AppLocalizations.of(context)!.language,
            item: IconButton(
              onPressed: () {
                //todo: show language bottom sheet
                showLanguageBottomSheet();
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          ProfileItem(
            text: AppLocalizations.of(context)!.logout,
            item: IconButton(
              onPressed: () {
                //todo: logout
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.loginRouteName,
                  (route) => false,
                );
              },
              icon: Icon(Icons.logout, size: 25, color: AppColors.redColor),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
