import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hightable_mobile_v2/animations/bottom_up_animations.dart';
import 'package:hightable_mobile_v2/animations/shaker.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/params/update_password_params.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/providers/reset_password_provider.dart';
import 'package:hightable_mobile_v2/modules/authentication/views/screens/login_screen.dart';
import 'package:hightable_mobile_v2/modules/authentication/views/screens/signup_screen.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/custom_navigators.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:hightable_mobile_v2/utils/ui/helpers/otppage.dart';
import 'package:hightable_mobile_v2/utils/ui/helpers/successpage.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/background.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/text_field.dart';

import '../../authentication/domain/providers/signin_provider.dart';

class NewPassword extends StatefulWidget {
  static const String routeName = "/reset_page";
  const NewPassword({required this.code, super.key});

  final String code;

  @override
  State<NewPassword> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<NewPassword> {
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final _shakeKey = GlobalKey<ShakerState>();
  final _formKey = GlobalKey<FormState>();
  late UpdatePasswordParams _resetParams;

  @override
  void initState() {
    Helpers.logc("currentPage: ${NewPassword.routeName}");
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
                            final resetController =
                                ref.watch(resetPasswordProvider);
                            return Form(
                              key: _formKey,
                              child: AutofillGroup(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const YMargin(30),
                                    Text("New Password?",
                                        style: mediumStyle(
                                          22,
                                          AppColors.black02,
                                        )),
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                          "Try not to misplace it this time 😉",
                                          textAlign: TextAlign.center,
                                          style: mediumStyle(
                                            15,
                                            AppColors.black02,
                                          )),
                                    ),
                                    const YMargin(30),
                                    CustomTextField(
                                      title: "Enter new password",
                                      controller: password,
                                    ),
                                    const YMargin(20),
                                    CustomTextField(
                                      title: "Confirm password",
                                      controller: confirmpassword,
                                      validator: (s) {
                                        // ignore: unrelated_type_equality_checks
                                        if (s != password.text) {
                                          return "Passwords don't match";
                                        }
                                        return null;
                                      },
                                    ),
                                    const YMargin(20),
                                    Button(
                                        height: 50,
                                        text: "Submit",
                                        textStyle:
                                            mediumStyle(18, AppColors.white),
                                        function: () {
                                          setState(() {
                                            Helpers.logc(widget.code);
                                            _resetParams = UpdatePasswordParams(
                                              code: int.parse(widget.code),
                                              password: password.text,
                                            );
                                          });
                                          if (_formKey.currentState!
                                              .validate()) {
                                            resetController.updatePassword(
                                                context,
                                                params: _resetParams);
                                          }
                                        }),
                                    const YMargin(150),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            AppNavigators.routeReplacefade(
                                                context, const LoginScreen());
                                          },
                                          child: Text(
                                            "Back to login",
                                            style: mediumStyle(
                                              15,
                                              AppColors.prim1,
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
