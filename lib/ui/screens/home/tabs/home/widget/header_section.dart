import 'package:evently_app_mon_c21/core/utils/app_styles.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/providers/app_language_provider.dart';
import 'package:evently_app_mon_c21/providers/app_theme_provider.dart';
import 'package:evently_app_mon_c21/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    var width = context.width;
    var height = context.height;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              userProvider.currentUser!.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Spacer(),
        Icon(
          themeProvider.isDark
              ? Icons.dark_mode_outlined
              : Icons.wb_sunny_outlined,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.007,
          ),
          margin: EdgeInsetsDirectional.only(start: width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            languageProvider.appLanguage.toUpperCase(),
            style: AppStyles.semi14White,
          ),
        ),
      ],
    );
  }
}
