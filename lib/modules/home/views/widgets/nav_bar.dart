import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/tabs.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final List<SingleTab> _tabs = Tabs.loadTabs();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var tab = _tabs[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
            child: Container(
              width: 120.0,
              height: 50.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Helpers.callPng(tab.image, height: 40),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    tab.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color.fromRGBO(130, 130, 130, 0.8),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _tabs.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
