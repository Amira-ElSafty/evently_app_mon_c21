import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_styles.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/model/category.dart';
import 'package:evently_app_mon_c21/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;

  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? AppColors.transparentColor
              : Theme.of(context).dividerColor,
          width: 2,
        ),
        color: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).highlightColor,
      ),
      child: Row(
        spacing: width * 0.02,
        children: [
          Icon(
            category.icon,
            color: isSelected
                ? AppColors.whiteColor
                : Theme.of(context).primaryColor,
          ),
          Text(
            category.getCategoryName(languageProvider.appLanguage),
            style: isSelected
                ? AppStyles.medium16White
                : Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
