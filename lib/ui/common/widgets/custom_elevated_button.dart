import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  final Widget child;

  final double borderRadius;

  final Color? borderColor;

  final Color? backgroundColor;

  final double? verticalPadding;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 16,
    this.borderColor,
    this.backgroundColor,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            width: 2,
            color: borderColor ?? AppColors.transparentColor,
          ),
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
