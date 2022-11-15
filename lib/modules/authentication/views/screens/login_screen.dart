import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hightable_mobile_v2/animations/bottom_up_animations.dart';
import 'package:hightable_mobile_v2/animations/shaker.dart';
import 'package:hightable_mobile_v2/modules/authentication/views/screens/signup_screen.dart';
import 'package:hightable_mobile_v2/modules/resetpassword/views/reset-email.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/custom_navigators.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/background.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/text_field.dart';

import '../../domain/params/login_params.dart';
import '../../domain/providers/signin_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login_page";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _shakeKey = GlobalKey<ShakerState>();
  final _emailShakeKey = GlobalKey<ShakerState>();
  final _formKey = GlobalKey<FormState>();
  late LoginParams _loginParams;

  @override
  void initState() {
    Helpers.logc("currentPage: ${LoginScreen.routeName}");

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
                  height: screenHeight(context) / 1.5,
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
                        child: Consumer(
                          builder: (_, ref, __) {
                            final loginController = ref.watch(signInProvider);
                            return Form(
                              key: _formKey,
                              child: AutofillGroup(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const YMargin(30),
                                    Text("Login",
                                        style: mediumStyle(
                                          25,
                                          AppColors.black02,
                                        )),
                                    Text("Welcome username",
                                        style: mediumStyle(
                                          16,
                                          AppColors.black02,
                                        )),
                                    const YMargin(30),
                                    Shaker(
                                      key: _emailShakeKey,
                                      child: CustomTextField(
                                        title: "Email or Phone Number",
                                        controller: email,
                                        validator: (s) {
                                          if (s!.isEmpty) {
                                            _emailShakeKey.currentState!
                                                .shake();
                                            return "Enter your email address";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const YMargin(10),
                                    Shaker(
                                      key: _shakeKey,
                                      child: CustomTextField(
                                        title: "Password",
                                        controller: password,
                                        hide: loginController.passVisible,
                                        validator: (s) {
                                          if (s!.isEmpty) {
                                            _shakeKey.currentState!.shake();
                                            return "Enter your password";
                                          }
                                          return null;
                                        },
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            loginController.passVisible =
                                                !loginController.passVisible;
                                          },
                                          child: !loginController.passVisible
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility),
                                        ),
                                      ),
                                    ),
                                    const YMargin(10),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            loginController.passRem =
                                                !loginController.passRem;
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: loginController
                                                              .passRem
                                                          ? AppColors.prim1
                                                          : AppColors.grey03,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: loginController.passRem
                                                      ? const Icon(
                                                          Icons.check,
                                                          size: 10,
                                                          color:
                                                              AppColors.prim1,
                                                        )
                                                      : null,
                                                ),
                                                const XMargin(5),
                                                Text(
                                                  "Remember password",
                                                  style: mediumStyle(
                                                      14, AppColors.grey04),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            AppNavigators.routeReplacefade(
                                                context, const ResetEmail());
                                          },
                                          child: Text(
                                            "Forgot password",
                                            style: mediumStyle(
                                              14,
                                              AppColors.black02,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const YMargin(20),
                                    Button(
                                      height: 50,
                                      text: "Login",
                                      loading: loginController.loading,
                                      textStyle:
                                          mediumStyle(18, AppColors.white),
                                      function: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _loginParams = LoginParams(
                                              email: email.text,
                                              password: password.text,
                                            );
                                          });
                                          loginController
                                              .login(context,
                                                  params: _loginParams)
                                              .then((value) {
                                            if (!value) {
                                              _shakeKey.currentState!.shake();
                                            }
                                          });
                                        } else {
                                          Helpers.sendFeedback(level: 2);
                                        }
                                      },
                                    ),

                                    const YMargin(30),

                                    // SEPARATOR

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 2,
                                          width: 130,
                                          color: AppColors.grey04,
                                        ),
                                        Text(
                                          "Or continue with",
                                          style:
                                              mediumStyle(14, AppColors.grey04),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            child: Helpers.callSvg(
                                                SvgAssets.google,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have an account? ",
                                          style:
                                              mediumStyle(15, AppColors.grey04),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            AppNavigators.routeReplacefade(
                                                context, const SignUpScreen());
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: mediumStyle(
                                              15,
                                              AppColors.prim1,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
