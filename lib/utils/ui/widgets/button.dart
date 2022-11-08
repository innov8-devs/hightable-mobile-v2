import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../spacer.dart';
import '../../text_style_util.dart';
import '../app_colors.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    this.icon,
    required this.text,
    Key? key,
    this.width,
    this.height = 44,
    this.borderWidth = 1,
    this.elevation,
    this.function,
    this.borderRadius,
    this.borderColor,
    this.color,
    this.backgroundColor = AppColors.prim1,
    this.feedbackImpact = 1,
    this.withFeedback = true,
    this.loading = false,
    this.textStyle,
    this.iconPosition,
  }) : super(key: key);

  late String text;
  Widget? icon;
  double? width;
  double? height;
  double borderWidth;
  VoidCallback? function;
  Color? borderColor;
  Color? backgroundColor;
  TextStyle? textStyle;
  double? elevation;
  double? borderRadius;
  Color? color;
  int? feedbackImpact;
  bool withFeedback;
  bool loading;
  String? iconPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? screenWidth(context, percent: 0.89),
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: elevation,
          shadowColor: color ?? AppColors.prim1,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          ),
          backgroundColor: function == null
              ? Colors.grey
              : loading
                  ? Colors.grey.shade400
                  : backgroundColor,
          minimumSize: Size(width ?? 140, height ?? 60),
        ),
        onPressed: loading
            ? null
            : function == null
                ? null
                : () {
                    if (withFeedback) {
                      feedbackImpact == 1
                          ? HapticFeedback.lightImpact()
                          : feedbackImpact == 2
                              ? HapticFeedback.mediumImpact()
                              : HapticFeedback.heavyImpact();
                    }
                    if (function != null) {
                      function?.call();
                    }
                  },
        child: loading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconPosition == "left") icon ?? const SizedBox(),
                  if (icon != null) const XMargin(10),
                  Expanded(
                    flex: icon != null ? 0 : 3,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: textStyle ?? mediumStyle(14, AppColors.white),
                        ),
                      ),
                    ),
                  ),
                  if (icon != null) const XMargin(10),
                  if (iconPosition == "right") icon ?? const SizedBox(),
                ],
              ),
      ),
    );
  }
}
