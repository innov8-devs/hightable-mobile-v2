import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';

import '../../../../utils/ui/widgets/button.dart';

class PrefrencesWidget extends StatefulWidget {
  final List prefrenceTitle;
  final List prefrenceContent;
  const PrefrencesWidget(
      {super.key,
      required this.prefrenceTitle,
      required this.prefrenceContent});

  @override
  State<PrefrencesWidget> createState() => _PrefrencesWidgetState();
}

class _PrefrencesWidgetState extends State<PrefrencesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            // width: 250,
            height: 56,
            child: DropdownButtonFormField(
              hint: const Text("Find more interests"),
              icon: const Icon(Icons.keyboard_arrow_down),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.black02,
                  ),
                ),
              ),
              onChanged: (_) {},
              items: [],
            ),
          ),
        ),
        const YMargin(20),
        ConstrainedBox(
          constraints:
              const BoxConstraints(minHeight: 10, maxHeight: double.infinity),
          child: ListView.builder(
              itemCount: widget.prefrenceTitle.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.prefrenceTitle[index],
                      style: semiBoldStyle(15, AppColors.blue04),
                    ),
                    const YMargin(10),
                    Wrap(
                      runSpacing: 10,
                      spacing: 20,
                      children: [
                        ...List.generate(
                            widget.prefrenceContent.length,
                            // widget.prefrenceContent.length,
                            (index) => GestureDetector(
                                  child: IntrinsicWidth(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: AppColors.blue04,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Text(
                                            widget.prefrenceContent[index],
                                            style: mediumStyle(
                                                15, AppColors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                    const YMargin(30),
                  ],
                );
              }),
        ),
        Button(
          text: "Continue",
          textStyle: mediumStyle(16, AppColors.white),
          function: () {
            // setupController.saveInterests(context);
          },
        ),
        const YMargin(20),
        Center(
          child: Text(
            "Skip",
            style: mediumStyle(
              15,
              AppColors.prim1,
            ),
          ),
        ),
        const YMargin(20),
      ],
    );
  }
}
