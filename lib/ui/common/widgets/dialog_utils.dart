import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_styles.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingMessage,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          spacing: context.width * 0.06,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.mainLightColor),
            Text(loadingMessage, style: AppStyles.medium16MainColor),
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String title = '',
    String? posActionName,
    VoidCallback? onPosAction,
    String? negActionName,
    VoidCallback? onNegAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(onPosAction != null){
            //   onPosAction.call();
            // }
            onPosAction?.call();
          },
          child: Text(posActionName, style: AppStyles.medium18MainColor),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onNegAction?.call();
          },
          child: Text(negActionName, style: AppStyles.medium16MainDarkColor),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message, style: AppStyles.semi24MainLightColor),
        title: Text(title, style: AppStyles.medium18MainColor),
        actions: actions,
      ),
    );
  }
}
