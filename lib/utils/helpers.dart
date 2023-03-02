import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ui/ui_helpers.dart';

class Helpers {
  static Widget callSvg(
    String path, {
    Color? color,
    double? height,
    double? width,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        path,
        color: color,
      ),
    );
  }

  static Widget callPng(
    String path, {
    Color? color,
    BoxFit? fit,
    double? height,
  }) {
    return Image.asset(
      path,
      fit: fit,
      height: height,
    );
  }

  static void closeKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context); // SHOULD BE builderContext
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static Future<void> copyToClipboard({
    required BuildContext context,
    String? copyValue,
    String? snackBarMessage,
  }) {
    return Clipboard.setData(ClipboardData(text: copyValue)).then((_) {
      UI.showSnack(context, "Copied!");
    });
  }

  static void sendFeedback({int level = 1}) {
    level == 1
        ? HapticFeedback.lightImpact()
        : level == 2
            ? HapticFeedback.mediumImpact()
            : HapticFeedback.heavyImpact();
  }

  static void log(Object o) {
    if (kDebugMode) {
      print("``````````````\n $o \n\n``````````````");
    }
  }

  static void logc(Object o) {
    if (kDebugMode) {
      dev.log("$o");
    }
  }

  static String parseError(dynamic exception) {
    try {
      final List<String> errorTitles = exception.message.keys.toList();
      final error = errorTitles
          .map((e) => "${exception.message[e][0]}\n")
          .toList()
          .toString();
      return error.replaceAll(RegExp('[^A-Za-z  \n]'), '');
    } catch (e) {
      return exception.toString();
    }
  }
}

class CountManager {
  String getNoOfvalue(double value) {
    if (value <= int.parse("999")) {
      return '$value';
    } else {
      final divideBy = getDivideByValue(value);
      return getDividendValue(value, divideBy);
    }
  }

  int getDivideByValue(double value) {
    if (value >= int.parse("1000") && value < int.parse("100000")) {
      return 100;
    }
    return 100000;
  }

  String getDividendValue(double value, int divideBy) {
    final appendee = divideBy == 100 ? 'K' : 'M';
    final precedingValue = (value ~/ divideBy).toString();
    final list = precedingValue.split('')..removeLast();
    final beforeDot = list.join();
    final afterDot = precedingValue.split('').last;
    if (afterDot == '0') {
      return beforeDot + appendee;
    } else {
      return '$beforeDot.$afterDot$appendee';
    }
  }
}
