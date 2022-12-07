import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/animations/shaker.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/domain/providers/setup_provider.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/views/widgets/interests_container.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/views/widgets/interests_widgets.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/views/widgets/prefrences_widgets.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/views/widgets/steps_indicator.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/constants.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';

class AccountSetup extends ConsumerStatefulWidget {
  const AccountSetup({super.key});

  @override
  ConsumerState<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends ConsumerState<AccountSetup> {
  @override
  Widget build(BuildContext context) {
    final setupController = ref.watch(setupProvider);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 300,
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageAssets.setupimg))),
                ),
                Container(
                  height: 300,
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.transparent, AppColors.black02],
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to HighTable",
                          style: boldStyle(22, AppColors.prim1),
                        ),
                        Text(
                          "Let’s get you started properly with a some recommendations you would like.",
                          style: mediumStyle(17, AppColors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            StepsIndicator(
              stage1: setupController.interests,
              stage2: setupController.prefrences,
              stage3: setupController.allergies,
            ),
            const YMargin(20),
            SizedBox(
              width: 350,
              child: Text(
                  "Please setup your ${setupController.interests == true ? "prefrences" : setupController.prefrences == true ? "allergies" : setupController.allergies == true ? "allergies" : "interests"} in a few simple steps",
                  textAlign: TextAlign.center,
                  style: semiBoldStyle(
                    18.5,
                    AppColors.blue04,
                  )),
            ),
            const YMargin(10),
            setupController.selectedInterests.length < 3
                ? Text(
                    "Select at least 3 ${setupController.interests == true ? "prefrences" : setupController.prefrences == true ? "allergies" : setupController.allergies == true ? "allergies" : "interests"}",
                    style: semiBoldStyle(
                      12,
                      AppColors.errorColor,
                    ))
                : Text(
                    "Select at least 3 ${setupController.interests == true ? "prefrences" : setupController.prefrences == true ? "allergies" : setupController.allergies == true ? "allergies" : "interests"}",
                    style: semiBoldStyle(
                      12,
                      AppColors.grey06,
                    )),
            const YMargin(15),
            setupController.interests == true
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: PrefrencesWidget(prefrenceTitle: [
                        "Outdoor",
                        "Music"
                      ], prefrenceContent: [
                        "Driving",
                        "Hiking",
                        "Rock Climbing",
                        "Flying",
                        "Walking",
                        " Climbing"
                      ]),
                    ),
                  )
                : const InterestsWidget()
          ],
        ),
      )),
    );
  }
}
