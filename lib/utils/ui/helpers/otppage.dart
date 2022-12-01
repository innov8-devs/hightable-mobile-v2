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

import '../../../modules/authentication/domain/providers/signup_provider.dart';

class OtpPage extends StatefulWidget {
  static const String routeName = "/otp_page";
  final String email;
  final Widget route;
  final String? routeNamee;
  const OtpPage(
      {this.routeNamee, required this.email, required this.route, super.key});

  @override
  State<OtpPage> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<OtpPage> {
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  final t3 = TextEditingController();
  final t4 = TextEditingController();
  final t5 = TextEditingController();
  final t6 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late num _otp;

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
                      topLeft: Radius.circular(78),
                      topRight: Radius.circular(78)),
                  child: SingleChildScrollView(
                      child: Consumer(builder: (_, ref, __) {
                    final signupController = ref.watch(signUpProvider);
                    return Form(
                      key: _formKey,
                      child: AutofillGroup(
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
                              child: Text(
                                  "Enter the verification code sent to you",
                                  textAlign: TextAlign.center,
                                  style: normalStyle(
                                    15,
                                    AppColors.black02,
                                  )),
                            ),
                            const YMargin(20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      controller: t1,
                                      maxLength: 1,
                                      onChanged: (s) {
                                        if (s.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      style:
                                          semiBoldStyle(20, AppColors.black02),
                                    ),
                                  ),
                                  const XMargin(9),
                                  SizedBox(
                                    width: 40,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      controller: t2,
                                      maxLength: 1,
                                      onChanged: (s) {
                                        if (s.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (s.isEmpty) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      style:
                                          semiBoldStyle(20, AppColors.black02),
                                    ),
                                  ),
                                  const XMargin(9),
                                  SizedBox(
                                    width: 40,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      controller: t3,
                                      maxLength: 1,
                                      onChanged: (s) {
                                        if (s.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (s.isEmpty) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      style:
                                          semiBoldStyle(20, AppColors.black02),
                                    ),
                                  ),
                                  const XMargin(15),
                                  Container(
                                    height: 1,
                                    width: 20,
                                    color: AppColors.black02,
                                  ),
                                  const XMargin(15),
                                  SizedBox(
                                    width: 40,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      controller: t4,
                                      maxLength: 1,
                                      onChanged: (s) {
                                        if (s.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (s.isEmpty) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      style:
                                          semiBoldStyle(20, AppColors.black02),
                                    ),
                                  ),
                                  const XMargin(9),
                                  SizedBox(
                                    width: 40,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      controller: t5,
                                      maxLength: 1,
                                      onChanged: (s) {
                                        if (s.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (s.isEmpty) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      style:
                                          semiBoldStyle(20, AppColors.black02),
                                    ),
                                  ),
                                  const XMargin(9),
                                  SizedBox(
                                    width: 40,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      controller: t6,
                                      maxLength: 1,
                                      onChanged: (s) {
                                        if (s.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (s.isEmpty) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      style:
                                          semiBoldStyle(20, AppColors.black02),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const YMargin(50),
                            Button(
                                height: 50,
                                text: "Verify",
                                textStyle: mediumStyle(18, AppColors.white),
                                loading: signupController.loading,
                                function: () {
                                  String otp = t1.text +
                                      t2.text +
                                      t3.text +
                                      t4.text +
                                      t5.text +
                                      t6.text;
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _otp = int.parse(otp);
                                    });
                                    signupController.verify(context,
                                        route: widget.route,
                                        params: _otp,
                                        routename: widget.routeNamee);
                                  } else {
                                    Helpers.sendFeedback(level: 2);
                                  }
                                }),
                            const YMargin(50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn't recieve any code? ",
                                  style: mediumStyle(15, AppColors.grey04),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    signupController.resendOTP(context,
                                        params: widget.email);
                                  },
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
                        ),
                      ),
                    );
                  })),
                ),
              ))
        ]),
      ),
    );
  }
}
