import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/model/category.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/widget/category_item.dart';
import 'package:flutter/material.dart';

class EventsSection extends StatefulWidget {
  EventsSection({super.key});

  @override
  State<EventsSection> createState() => _EventsSectionState();
}

class _EventsSectionState extends State<EventsSection> {
  List<Category> categoriesList = Category.getAllCategories();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return DefaultTabController(
      length: categoriesList.length,
      child: TabBar(
        isScrollable: true,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        labelPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
        tabAlignment: TabAlignment.start,
        indicatorColor: AppColors.transparentColor,
        dividerColor: AppColors.transparentColor,
        tabs: categoriesList.map((category) {
          return CategoryItem(
            category: category,
            isSelected: selectedIndex == categoriesList.indexOf(category),
          );
        }).toList(),
      ),
    );
  }
}
