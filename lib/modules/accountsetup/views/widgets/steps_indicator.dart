import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/views/widgets/interests_container.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';

class StepsIndicator extends StatefulWidget {
  final bool stage1;
  final bool stage2;
  final bool stage3;
  const StepsIndicator(
      {required this.stage1,
      required this.stage2,
      required this.stage3,
      super.key});

  @override
  State<StepsIndicator> createState() => _StepsIndicatorState();
}

class _StepsIndicatorState extends State<StepsIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.prim1),
                    child: const Center(
                        child: Text(
                      "1",
                      style: TextStyle(color: AppColors.white, fontSize: 17),
                    )),
                  ),
                ],
              ),
              Container(
                height: 5,
                width: 120,
                color:
                    widget.stage1 == true ? AppColors.prim1 : AppColors.grey06,
              ),
              Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: widget.stage2 == true
                          ? Border.all(color: AppColors.transparent)
                          : Border.all(color: AppColors.grey06, width: 2.5),
                      color: widget.stage2 == true
                          ? AppColors.prim1
                          : AppColors.transparent),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: widget.stage2 == true
                              ? AppColors.white
                              : AppColors.grey06,
                          fontSize: 17),
                    ),
                  )),
              Container(
                height: 5,
                width: 120,
                color:
                    widget.stage2 == true ? AppColors.prim1 : AppColors.grey06,
              ),
              Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: widget.stage3 == true
                          ? Border.all(color: AppColors.transparent)
                          : Border.all(color: AppColors.grey06, width: 2.5),
                      color: widget.stage3 == true
                          ? AppColors.prim1
                          : AppColors.transparent),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: widget.stage3 == true
                              ? AppColors.white
                              : AppColors.grey06,
                          fontSize: 17),
                    ),
                  )),
            ],
          ),
          SizedBox(
            width: 343,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Interests",
                    style: mediumStyle(
                      14,
                      AppColors.grey06,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text("Prefrences",
                      style: mediumStyle(
                        14,
                        AppColors.grey06,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Allergies",
                      style: mediumStyle(
                        14,
                        AppColors.grey06,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
