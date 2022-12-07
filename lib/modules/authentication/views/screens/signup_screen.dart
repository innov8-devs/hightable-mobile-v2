import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hightable_mobile_v2/animations/bottom_up_animations.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/params/signup_params.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/providers/signup_provider.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/background.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/text_field.dart';

import '../../../../animations/shaker.dart';
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
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SignupParams _signupParams;
  Matrix4 scaleXYZTransform({
    double scaleX = 1.00,
    double scaleY = 1.00,
    double scaleZ = 1.00,
  }) {
    return Matrix4.diagonal3Values(scaleX, scaleY, scaleZ);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      child: Consumer(builder: (_, ref, __) {
                        final signupController = ref.watch(signUpProvider);
                        return Form(
                          key: _formKey,
                          child: AutofillGroup(
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
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return "Full name is required";
                                    }
                                    return null;
                                  },
                                ),
                                const YMargin(10),
                                CustomTextField(
                                  title: "Email or Phone Number",
                                  controller: email,
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return "Email or Phone Number is required";
                                    }
                                    return null;
                                  },
                                ),
                                const YMargin(10),
                                CustomTextField(
                                  title: "Username",
                                  controller: username,
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return "Username is required";
                                    }
                                    return null;
                                  },
                                ),
                                const YMargin(10),
                                CustomTextField(
                                  title: "Password",
                                  controller: password,
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                ),
                                const YMargin(10),
                                CustomTextField(
                                  title: "Confirm password",
                                  controller: confirmPassword,
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return "Please Confirm Password";
                                    }
                                    return null;
                                  },
                                ),
                                const YMargin(20),
                                Button(
                                  height: 50,
                                  text: "Sign Up",
                                  textStyle: mediumStyle(18, AppColors.white),
                                  loading: signupController.loading,
                                  function: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _signupParams = SignupParams(
                                          email: email.text,
                                          password: password.text,
                                          firstName:
                                              fullname.text.split(' ')[0],
                                          lastName: fullname.text.split(' ')[1],
                                          userName: username.text,
                                        );
                                      });
                                      signupController.signUp(context,
                                          params: _signupParams);
                                    } else {
                                      Helpers.sendFeedback(level: 2);
                                    }
                                  },
                                ),

                                const YMargin(30),

                                // SEPARATOR

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 2,
                                      width: 100,
                                      color: AppColors.grey04,
                                    ),
                                    const XMargin(5),
                                    Text(
                                      "Or continue with",
                                      style: mediumStyle(14, AppColors.grey04),
                                    ),
                                    const XMargin(5),
                                    Container(
                                      height: 2,
                                      width: 100,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.grey05,
                                              width: 2)),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.grey05,
                                              width: 2)),
                                      child: Center(
                                        child: Helpers.callSvg(
                                            SvgAssets.twitter,
                                            height: 25,
                                            width: 25),
                                      ),
                                    ),
                                    const XMargin(20),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.grey05,
                                              width: 2)),
                                      child: Center(
                                        child: Helpers.callSvg(
                                            SvgAssets.facebook,
                                            height: 25,
                                            width: 25),
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
                        );
                      }),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
