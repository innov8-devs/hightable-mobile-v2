import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/nav_bar.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Helpers.callPng(ImageAssets.logo, height: 70.0),
              Helpers.callSvg(SvgAssets.notifications, width: 30, height: 30),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30.0),
          child: NavBar(),
        ),
      ],
    );
  }
}
