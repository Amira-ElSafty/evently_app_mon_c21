import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_styles.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
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
              //todo: change language to english
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLanguage == 'en'
                ? _builtSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.english,
                  )
                : _builtUnSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.english,
                  ),
          ),
          InkWell(
            onTap: () {
              //todo: change language to arabic
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.appLanguage == "ar"
                ? _builtSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.arabic,
                  )
                : _builtUnSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _builtSelectedLanguageItem({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language, style: AppStyles.semi24MainLightColor),
        Icon(Icons.check, size: 30, color: AppColors.mainLightColor),
      ],
    );
  }

  Widget _builtUnSelectedLanguageItem({required String language}) {
    return Text(language, style: AppStyles.medium16Black);
  }
}
