import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/ui/common/widgets/custom_text_field.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/widget/event_item.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      spacing: height * 0.02,
      children: [
        CustomTextField(
          hintText: AppLocalizations.of(context)!.search_event,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          suffixIcon: Icon(
            Icons.search,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return EventItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: height * 0.02);
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
