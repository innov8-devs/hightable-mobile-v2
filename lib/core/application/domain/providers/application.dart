import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../modules/onboarding/views/screens/onboarding.dart';
import '../../../../utils/helpers.dart';

ChangeNotifierProvider<Application> applicationController =
    ChangeNotifierProvider((ref) => Application(ref: ref));

class Application extends ChangeNotifier {
  Application({this.ref});
  String _token = "";
  Ref? ref;
  bool _isLogged = false;

  bool get isLogged => _isLogged;
  String get token => _token;

  set token(String state) {
    _token = state;
    notifyListeners();
  }

  Future<void> goHome(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      OnboardingScreen.routeName,
      (route) => false,
    );

    Helpers.logc("raw ysr null");
  }
}
