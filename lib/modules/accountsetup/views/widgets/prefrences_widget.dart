import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';

import '../../../../utils/ui/app_colors.dart';

class PrefrencesWidget extends StatefulWidget {
  const PrefrencesWidget({super.key});

  @override
  State<PrefrencesWidget> createState() => _PrefrencesWidgetState();
}

class _PrefrencesWidgetState extends State<PrefrencesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SizedBox(
            // width: 250,
            height: 56,
            child: DropdownButtonFormField(
              hint: const Text("Find more prefrences"),
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
        const YMargin(15),
      ],
    );
  }
}
