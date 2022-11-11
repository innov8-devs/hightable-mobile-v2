// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/application/domain/providers/application.dart';
import '../../../../utils/ui/ui_helpers.dart';

ChangeNotifierProvider<SignInProvider> signInProvider =
    ChangeNotifierProvider((ref) => SignInProvider(ref: ref));

class SignInProvider extends ChangeNotifier {
  SignInProvider({required this.ref});
  Ref ref;
  bool _passVisible = false;
  bool _passRem = false;
  bool _loading = false;

  bool get loading => _loading;
  bool get passVisible => _passVisible;
  bool get passRem => _passRem;

  set passVisible(bool state) {
    _passVisible = state;
    notifyListeners();
  }

  set passRem(bool state) {
    _passRem = state;
    notifyListeners();
  }

  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }

  Future<bool> login(
    BuildContext context, {
    required String email,
    required String password,
    bool routeAfter = true,
  }) async {
    loading = true;

    // loading = false;

    return false;
  }
}
