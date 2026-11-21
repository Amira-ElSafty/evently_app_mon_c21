import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String text;

  final Widget item;

  const ProfileItem({super.key, required this.text, required this.item});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).highlightColor,
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
      ),
      child: ListTile(
        title: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        trailing: item,
      ),
    );
  }
}
