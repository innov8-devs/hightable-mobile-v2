import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/core/application/components/BottomNavigationBar.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/header.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Helpers.logc("currentPage: ${HomeScreen.routeName}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: const [
            Header(),
          ],
        ),
      ),
    );
  }
}
