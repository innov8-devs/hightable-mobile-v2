import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/core/db/user_db.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/models/token.dart';

// import '../../../../modules/authentication/domain/entities/user.dart';
import '../../../../modules/onboarding/views/screens/onboarding.dart';
import '../../../../utils/helpers.dart';
import '../../../config/DI/di.dart';
import '../../repositories/user_repository.dart';

ChangeNotifierProvider<Application> applicationController =
    ChangeNotifierProvider((ref) => Application(ref: ref));

class Application extends ChangeNotifier {
  Application({this.ref}) {
    final userInstance = UserDb.getInstance();
    _isLogged = userInstance?.accessToken != null ? true : false;
  }
  Token _data = const Token();
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

  Future<void> onLogin(Token data, BuildContext context,
      {bool shouldSetup = true}) async {
    _data = data;
    if (shouldSetup) {
      await setup(context);
    }
    return;
  }

  Future<void> setup(BuildContext context) async {
    await locator.get<UserRepository>().getUser();

    locator.get<Application>()._data = _data;
    try {} catch (e) {
      Helpers.log("here $e");
    }
  }
}
