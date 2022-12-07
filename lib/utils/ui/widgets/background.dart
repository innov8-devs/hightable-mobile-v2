import 'package:flutter/material.dart';

import '../../../animations/slide_in_right.dart';
import '../../../animations/slide_left_animation.dart';
import '../../assets.dart';
import '../../helpers.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => BackgroundState();
}

class BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
