import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hightable_mobile_v2/animations/bottom_up_animations.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/custom_navigators.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/spacer.dart';
import 'package:hightable_mobile_v2/utils/text_style_util.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/background.dart';
import 'package:hightable_mobile_v2/utils/ui/widgets/button.dart';

class SucessPage extends StatefulWidget {
  static const String routeName = "/success_page";
  const SucessPage(
      {required this.title,
      required this.btntxt,
      required this.route,
      required this.disaibled,
      super.key});

  final String title;
  final String btntxt;
  final Widget route;
  final bool disaibled;

  @override
  State<SucessPage> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SucessPage> {
  @override
  void initState() {
    Helpers.logc("currentPage: ${SucessPage.routeName}");
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
                        child: Column(
                          children: [
                            const YMargin(120),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Helpers.callPng(ImageAssets.check),
                            ),
                            const YMargin(40),
                            Text(widget.title,
                                style: boldStyle(
                                  23,
                                  AppColors.black02,
                                )),
                            const YMargin(100),
                            Button(
                              height: 50,
                              text: widget.btntxt,
                              textStyle: mediumStyle(18, AppColors.white),
                              function: () {
                                widget.disaibled == true
                                    ? null
                                    : AppNavigators.routeReplacefade(
                                        context, widget.route);
                              },
                            ),
                          ],
                        )),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
