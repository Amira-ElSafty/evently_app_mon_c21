import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/ui/screens/home/tabs/widget/event_item.dart';
import 'package:flutter/material.dart';

class EventsListSection extends StatelessWidget {
  const EventsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return EventItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: height * 0.02);
        },
        itemCount: 20,
      ),
    );
  }
}
