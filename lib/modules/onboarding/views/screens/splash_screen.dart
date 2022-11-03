// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/animations/fade_in_animation.dart';
import 'package:hightable_mobile_v2/animations/slide_in_right.dart';
import 'package:hightable_mobile_v2/animations/slide_left_animation.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';

import '../../../../core/application/domain/providers/application.dart';
import 'onboarding.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = '/splash_screen';
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    final setup = ref.read(applicationController);

    await Future.delayed(const Duration(seconds: 2));
    if (setup.isLogged) {
      await setup.goHome(context);
    } else {
      await Navigator.popAndPushNamed(context, OnboardingScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  right: 0,
                  child: SlideInRightAnimation(
                      delay: 0.5, child: Helpers.callSvg(SvgAssets.ellipse1))),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: SlideInRightAnimation(
                      delay: 0.5, child: Helpers.callSvg(SvgAssets.ellipse2))),
              Center(
                child: FadeInAnimations(
                  delay: 0.6,
                  child: Helpers.callPng(ImageAssets.logo, height: 130),
                ),
              ),
              Positioned(
                  left: 0,
                  bottom: 60,
                  child: SlideInLeftAnimation(
                    delay: 0.5,
                    child: Helpers.callSvg(
                      SvgAssets.ellipse3,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
