import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/providers/app_language_provider.dart';
import 'package:evently_app_mon_c21/providers/app_theme_provider.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/home/widget/events_list_section.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/home/widget/events_section.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/home/widget/header_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late AppThemeProvider themeProvider;

  late AppLanguageProvider languageProvider;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    themeProvider = Provider.of<AppThemeProvider>(context);
    languageProvider = Provider.of<AppLanguageProvider>(context);
    return Column(
      spacing: height * 0.02,
      children: [HeaderSection(), EventsSection(), EventsListSection()],
    );
  }
}
