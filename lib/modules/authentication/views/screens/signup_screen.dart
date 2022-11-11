import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hightable_mobile_v2/animations/bottom_up_animations.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/background.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/text_field.dart';

import '../../../../utils/custom_navigators.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/sign_up";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  height: screenHeight(context) / 1.2,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const YMargin(30),
                          Text("Register",
                              style: mediumStyle(
                                25,
                                AppColors.black02,
                              )),
                          Text("Create your account",
                              style: mediumStyle(
                                16,
                                AppColors.black02,
                              )),
                          const YMargin(30),
                          CustomTextField(
                            title: "Full Name",
                            controller: fullname,
                          ),
                          const YMargin(10),
                          CustomTextField(
                            title: "Email or Phone Number",
                            controller: fullname,
                          ),
                          const YMargin(10),
                          CustomTextField(
                            title: "Username",
                            controller: fullname,
                          ),
                          const YMargin(10),
                          CustomTextField(
                            title: "Password",
                            controller: fullname,
                          ),
                          const YMargin(10),
                          CustomTextField(
                            title: "Confirm password",
                            controller: fullname,
                          ),
                          const YMargin(20),
                          Button(
                            height: 50,
                            text: "Sign Up",
                            textStyle: mediumStyle(18, AppColors.white),
                            function: () {},
                          ),

                          const YMargin(30),

                          // SEPARATOR

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 2,
                                width: 130,
                                color: AppColors.grey04,
                              ),
                              Text(
                                "Or continue with",
                                style: mediumStyle(14, AppColors.grey04),
                              ),
                              Container(
                                height: 2,
                                width: 130,
                                color: AppColors.grey04,
                              )
                            ],
                          ),

                          // End of Separator

                          const YMargin(20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.grey05, width: 2)),
                                child: Center(
                                  child: Helpers.callSvg(SvgAssets.google,
                                      height: 25, width: 25),
                                ),
                              ),
                              const XMargin(20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.grey05, width: 2)),
                                child: Center(
                                  child: Helpers.callSvg(SvgAssets.twitter,
                                      height: 25, width: 25),
                                ),
                              ),
                              const XMargin(20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.grey05, width: 2)),
                                child: Center(
                                  child: Helpers.callSvg(SvgAssets.facebook,
                                      height: 25, width: 25),
                                ),
                              )
                            ],
                          ),

                          const YMargin(20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: mediumStyle(15, AppColors.grey04),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Helpers.logc(
                                      "Routing to: ${LoginScreen.routeName}");
                                  AppNavigators.routeReplacefade(
                                      context, const LoginScreen());
                                },
                                child: Text(
                                  "Login now",
                                  style: mediumStyle(
                                    15,
                                    AppColors.prim1,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const YMargin(20)
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
