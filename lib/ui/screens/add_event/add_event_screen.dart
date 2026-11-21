import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_styles.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/model/category.dart';
import 'package:evently_app_mon_c21/providers/app_language_provider.dart';
import 'package:evently_app_mon_c21/providers/app_theme_provider.dart';
import 'package:evently_app_mon_c21/ui/common/widgets/custom_elevated_button.dart';
import 'package:evently_app_mon_c21/ui/common/widgets/custom_text_field.dart';
import 'package:evently_app_mon_c21/ui/screens/add_event/widget/custom_date_time_widget.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<Category> categoriesList = Category.getCategories();
  int selectedIndex = 2;
  DateTime? selectedDate;

  String formatDate = '';
  TimeOfDay? selectedTime;

  String formatTime = '';
  String title = '';
  String description = '';
  late AppLanguageProvider languageProvider;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var local = AppLocalizations.of(context)!;
    languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(local.add_event,
          style: Theme
              .of(context)
              .textTheme
              .titleSmall,),
        leading: Container(
          margin: EdgeInsetsDirectional.only(
              start: width * 0.04,
              top: height * 0.01,
              bottom: height * 0.01
          ),
          child: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Theme
                      .of(context)
                      .highlightColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: Theme
                              .of(context)
                              .dividerColor,
                          width: 2
                      )
                  )
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined,
                color: themeProvider.isDark ? AppColors.whiteColor :
                AppColors.mainLightColor,)
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: height * 0.02,
              children: [
                Container(
                  height: height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          width: 2,
                          color: Theme
                              .of(context)
                              .dividerColor
                      ),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(categoriesList[selectedIndex]
                              .getCategoryImage(themeProvider.isDark))
                      )
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {

                            });
                          },
                          child: CategoryItem(
                              category: categoriesList[index],
                              isSelected: selectedIndex == index
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: width * 0.04,);
                      },
                      itemCount: categoriesList.length
                  ),
                ),
                Text(local.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,),
                CustomTextField(
                  hintText: local.event_title,
                  hintStyle: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                  onChanged: (text) {
                    title = text;
                  },
                  validator: (text) {
                    if (text == null || text
                        .trim()
                        .isEmpty) {
                      return "Please Enter Event Title.";
                    }
                    return null;
                  },
                ),
                Text(local.description,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,),
                CustomTextField(
                  hintText: local.event_description,
                  hintStyle: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                  maxLines: 3,
                  onChanged: (text) {
                    description = text;
                  },
                  validator: (text) {
                    if ((text == null || text
                        .trim()
                        .isEmpty)) {
                      return "Please enter Event Description.";
                    }
                    return null;
                  },
                ),
                CustomDateTimeWidget(
                    icon: Icons.date_range_outlined,
                    eventDateOrTime: local.event_date,
                    chooseDateOrTime: selectedDate == null ?
                    local.choose_date :
                    formatDate,
                    onPressed: chooseDate
                ),
                CustomDateTimeWidget(
                    icon: Icons.timer_outlined,
                    eventDateOrTime: local.event_time,
                    chooseDateOrTime: selectedTime == null ?
                    local.choose_time : formatTime,
                    onPressed: chooseTime
                ),
                CustomElevatedButton(
                    onPressed: addEvent,
                    verticalPadding: height * 0.01,
                    child: Text(local.add_event,
                      style: AppStyles.medium20White,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      //todo: add event to database
    }
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        locale: Locale(languageProvider.appLanguage),
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if (chooseDate != null) {
      selectedDate = chooseDate;
      formatDate =
          DateFormat('dd/MM/yyyy', languageProvider.appLanguage).format(
              selectedDate!);
    }
    setState(() {

    });
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(context: context,
        initialTime: TimeOfDay.now()
    );
    // if (!mounted) return;
    if (chooseTime != null) {
      selectedTime = chooseTime;
      formatTime = selectedTime!.format(context);
    }
    setState(() {

    });
  }
}
