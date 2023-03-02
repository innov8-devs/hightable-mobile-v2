import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            spreadRadius: -7,
            blurRadius: 63,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Helpers.callSvg(SvgAssets.home, height: 35, width: 35),
          Helpers.callSvg(SvgAssets.explore, height: 35, width: 35),
          Helpers.callSvg(SvgAssets.socialCalendar, height: 35, width: 35),
          Helpers.callSvg(SvgAssets.messages, height: 35, width: 35),
          Helpers.callSvg(SvgAssets.profile, height: 35, width: 35),
        ],
      ),
    );
  }
}
