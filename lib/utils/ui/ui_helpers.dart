import 'package:flutter/material.dart';

import '../helpers.dart';
import 'app_colors.dart';

class UI {
  static void showSnack(
    BuildContext context,
    String message, {
    String callBackText = "Okay",
    VoidCallback? callback,
    Color? bkgColor,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: bkgColor ?? Colors.green,
      action: callback == null
          ? null
          : SnackBarAction(
              label: callBackText,
              onPressed: callback,
            ),
    );
    Helpers.sendFeedback();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showErrorSnack(
    BuildContext context,
    String message, {
    String callBackText = "Okay",
    VoidCallback? callback,
    Color? bkgColor,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: bkgColor ?? AppColors.errorColor,
      action: callback == null
          ? null
          : SnackBarAction(
              label: callBackText,
              onPressed: callback,
            ),
    );
    Helpers.sendFeedback(level: 2);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
