import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';

class InterestsContainer extends StatefulWidget {
  final bool? selected;
  final String content;
  const InterestsContainer(
      {this.selected = false, required this.content, super.key});

  @override
  State<InterestsContainer> createState() => _InterestsContainerState();
}

class _InterestsContainerState extends State<InterestsContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.selected == true
        ? Container(
            height: 56,
            width: 105,
            decoration: BoxDecoration(
                color: AppColors.blue04,
                borderRadius: BorderRadius.circular(13)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          color: AppColors.white, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: AppColors.blue04,
                          size: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 67,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 9),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            child: Text(widget.content,
                                textScaleFactor: 0.86,
                                style: customStyle(
                                  14,
                                  AppColors.white,
                                  1.1,
                                  FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            height: 56,
            width: 105,
            decoration: BoxDecoration(
                color: AppColors.grey07,
                border: Border.all(color: AppColors.blue04op2),
                borderRadius: BorderRadius.circular(13)),
            child: SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.content,
                      textScaleFactor: 0.96,
                      style: customStyle(
                        14,
                        AppColors.blue04,
                        1.3,
                        FontWeight.bold,
                      )),
                ),
              ),
            ),
          );
  }
}
