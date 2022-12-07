import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/spacer.dart';
import '../../../../utils/text_style_util.dart';
import '../../../../utils/ui/app_colors.dart';
import '../../../../utils/ui/widgets/button.dart';
import '../../domain/providers/setup_provider.dart';
import 'interests_container.dart';

class InterestsWidget extends ConsumerStatefulWidget {
  const InterestsWidget({super.key});

  @override
  ConsumerState<InterestsWidget> createState() => _InterestsWidgetState();
}

class _InterestsWidgetState extends ConsumerState<InterestsWidget> {
  @override
  Widget build(BuildContext context) {
    final setupController = ref.watch(setupProvider);
    return Column(
      children: [
        Wrap(
          runSpacing: 10,
          spacing: 15,
          children: [
            ...List.generate(
              AppConstants.interests.length,
              (index) => GestureDetector(
                  onTap: () {
                    setupController
                        .addInterests(AppConstants.interests[index].toString());
                  },
                  child: InterestsContainer(
                    content: AppConstants.interests[index],
                    selected: setupController.selectedInterests
                            .contains(AppConstants.interests[index].toString())
                        ? true
                        : false,
                  )),
            ),
          ],
        ),
        const YMargin(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
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
        const YMargin(30),
        Button(
          text: "Continue",
          textStyle: mediumStyle(16, AppColors.white),
          function: () {
            setupController.saveInterests(context);
          },
        ),
        const YMargin(20),
        Text(
          "Skip",
          style: mediumStyle(
            15,
            AppColors.prim1,
          ),
        ),
        const YMargin(20),
      ],
    );
  }
}
