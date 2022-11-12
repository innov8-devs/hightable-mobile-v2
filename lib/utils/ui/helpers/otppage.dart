import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hightable_mobile_v2/animations/bottom_up_animations.dart';
import 'package:hightable_mobile_v2/animations/shaker.dart';
import 'package:hightable_mobile_v2/modules/authentication/views/screens/signup_screen.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/custom_navigators.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:hightable_mobile_v2/utils/ui/helpers/successpage.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/background.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/text_field.dart';

class OtpPage extends StatefulWidget {
  static const String routeName = "/reset_page";
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<OtpPage> {
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  final t3 = TextEditingController();
  final t4 = TextEditingController();

  @override
  void initState() {
    Helpers.logc("currentPage: ${OtpPage.routeName}");
    super.initState();
  }

  final fullname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const Background(),
          Positioned(
              bottom: 0,
              left: -1.5,
              child: BottomUpAnimaitons(
                delay: 1,
                child: GlassContainer(
                  height: screenHeight(context) / 1.7,
                  width: screenWidth(context) * 1.01,
                  blur: 4,
                  color: Colors.white.withOpacity(0.1),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.3),
                    ],
                  ),
                  shadowStrength: 5,
                  border: Border.all(color: AppColors.white, width: 1.5),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(90)),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const YMargin(30),
                      Text("Confirm account",
                          style: mediumStyle(
                            22,
                            AppColors.black02,
                          )),
                      const YMargin(5),
                      SizedBox(
                        width: 200,
                        child: Text("Enter the verification code sent to you",
                            textAlign: TextAlign.center,
                            style: normalStyle(
                              15,
                              AppColors.black02,
                            )),
                      ),
                      const YMargin(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            height: 90,
                            width: 70,
                            controller: t1,
                            maxLength: 1,
                            onChanged: (s) {
                              if (s.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            style: semiBoldStyle(20, AppColors.black02),
                          ),
                          const XMargin(32),
                          CustomTextField(
                            height: 90,
                            width: 70,
                            controller: t2,
                            maxLength: 1,
                            onChanged: (s) {
                              if (s.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else if (s.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            style: semiBoldStyle(20, AppColors.black02),
                          ),
                          const XMargin(32),
                          CustomTextField(
                            height: 90,
                            width: 70,
                            controller: t3,
                            maxLength: 1,
                            onChanged: (s) {
                              if (s.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else if (s.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            style: semiBoldStyle(20, AppColors.black02),
                          ),
                          const XMargin(32),
                          CustomTextField(
                            height: 90,
                            width: 70,
                            controller: t4,
                            maxLength: 1,
                            onChanged: (s) {
                              if (s.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else if (s.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            style: semiBoldStyle(20, AppColors.black02),
                          ),
                        ],
                      ),
                      const YMargin(50),
                      Button(
                          height: 50,
                          text: "Verify",
                          textStyle: mediumStyle(18, AppColors.white),
                          function: () {}),
                      const YMargin(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't recieve any code? ",
                            style: mediumStyle(15, AppColors.grey04),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Resend code",
                              style: mediumStyle(
                                15,
                                AppColors.prim1,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ))
        ]),
      ),
    );
  }
}
