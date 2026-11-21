import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_styles.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.04,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              //todo: change theme to dark
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()
                ? _builtSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.dark,
                  )
                : _builtUnSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.dark,
                  ),
          ),
          InkWell(
            onTap: () {
              //todo: change theme to light
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.isDarkMode()
                ? _builtUnSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.light,
                  )
                : _builtSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.light,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _builtSelectedThemeItem({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme, style: AppStyles.semi24MainLightColor),
        Icon(Icons.check, size: 30, color: AppColors.mainLightColor),
      ],
    );
  }

  Widget _builtUnSelectedThemeItem({required String theme}) {
    return Text(theme, style: AppStyles.medium16Black);
  }
}
