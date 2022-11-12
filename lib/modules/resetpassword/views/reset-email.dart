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
import 'package:hightable_mobile_v2/utils/ui/helpers/otppage.dart';
import 'package:hightable_mobile_v2/utils/ui/helpers/successpage.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/background.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/text_field.dart';

import '../../authentication/domain/providers/signin_provider.dart';

class ResetEmail extends StatefulWidget {
  static const String routeName = "/reset_page";
  const ResetEmail({super.key});

  @override
  State<ResetEmail> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<ResetEmail> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _shakeKey = GlobalKey<ShakerState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Helpers.logc("currentPage: ${ResetEmail.routeName}");
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
                                    Text("Forgot your password?",
                                        style: mediumStyle(
                                          22,
                                          AppColors.black02,
                                        )),
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                          "Enter the e-mail used to register your account",
                                          textAlign: TextAlign.center,
                                          style: mediumStyle(
                                            15,
                                            AppColors.black02,
                                          )),
                                    ),
                                    const YMargin(30),
                                    CustomTextField(
                                      title: "Email",
                                      controller: email,
                                    ),
                                    const YMargin(10),
                                    const YMargin(20),
                                    Button(
                                        height: 50,
                                        text: "Next",
                                        textStyle:
                                            mediumStyle(18, AppColors.white),
                                        function: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            AppNavigators.routeReplacefade(
                                                context, const OtpPage());
                                          }
                                        }),
                                    const YMargin(150),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
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
