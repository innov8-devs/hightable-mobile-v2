import 'package:flutter/material.dart';

import '../helpers.dart';

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
      backgroundColor: bkgColor ?? Colors.black,
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
