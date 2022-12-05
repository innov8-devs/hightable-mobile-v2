import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/animations/shaker.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/domain/providers/setup_provider.dart';
import 'package:hightable_mobile_v2/modules/accountsetup/views/widgets/interests_container.dart';
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
              child: Text("Please setup your Prefrences in a few simple steps",
                  textAlign: TextAlign.center,
                  style: semiBoldStyle(
                    18.5,
                    AppColors.blue04,
                  )),
            ),
            const YMargin(10),
            setupController.selectedInterests.length < 3
                ? Text("Select at least 3 interests",
                    style: semiBoldStyle(
                      12,
                      AppColors.errorColor,
                    ))
                : Text("Select at least 3 interests",
                    style: semiBoldStyle(
                      12,
                      AppColors.grey06,
                    )),
            const YMargin(15),
            Wrap(
              runSpacing: 10,
              spacing: 15,
              children: [
                ...List.generate(
                  AppConstants.interests.length,
                  (index) => GestureDetector(
                      onTap: () {
                        setupController
                            .addItem(AppConstants.interests[index].toString());
                      },
                      child: InterestsContainer(
                        content: AppConstants.interests[index],
                        selected: setupController.selectedInterests.contains(
                                AppConstants.interests[index].toString())
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
        ),
      )),
    );
  }
}
