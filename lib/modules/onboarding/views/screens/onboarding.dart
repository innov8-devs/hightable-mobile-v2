import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/animations/fade_in_animation.dart';
import 'package:hightable_mobile_v2/animations/slide_in_right.dart';
import 'package:hightable_mobile_v2/animations/slide_left_animation.dart';
import 'package:hightable_mobile_v2/modules/onboarding/views/widgets/onb_indicator.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboardingScreen_screen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: 0,
                  child: SizedBox(
                      width: screenWidth(context),
                      child: FadeInAnimations(
                          delay: 0.5,
                          child: Helpers.callPng(ImageAssets.onb1)))),
              Positioned(
                left: 30,
                right: 30,
                bottom: 70,
                child: SlideInLeftAnimation(
                  delay: 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Discover",
                          style: boldStyle(
                            30,
                            AppColors.black02,
                          )),
                      SizedBox(
                        width: 270,
                        child: Text(
                            "Discover the best restaurants, bars, lounges and events near you.",
                            style: normalStyle(
                              16,
                              AppColors.grey03,
                            )),
                      ),
                      const YMargin(30),
                      const OnbIndicator(),
                      const YMargin(30),
                      Container(
                        height: 55,
                        width: 110,
                        decoration: BoxDecoration(
                            color: AppColors.blue03,
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                            child: Text("Skip",
                                style: normalStyle(
                                  17,
                                  AppColors.white,
                                ))),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: SlideInRightAnimation(
                    delay: 0.5,
                    child: Stack(
                      children: [
                        Helpers.callPng(ImageAssets.nextellipse, height: 200),
                        Positioned(
                          bottom: 60,
                          left: 60,
                          child: Text("Next",
                              style: boldStyle(
                                20,
                                AppColors.white,
                              )),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
