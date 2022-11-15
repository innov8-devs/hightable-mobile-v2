// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/params/login_params.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/params/signup_params.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/usecases/signup.dart';
import 'package:hightable_mobile_v2/modules/authentication/repositories/auth_repo_impl.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';

import '../../../../core/application/domain/providers/application.dart';
import '../../../../core/application/repositories/preference_repositories.dart';
import '../../../../core/config/DI/di.dart';
import '../../../../core/config/config.dart';
import '../../../../core/service_exceptions/src/gql_exceptions.dart';
import '../../../../core/services/remote/al_gql_client.dart';
import '../../../../main.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/ui/ui_helpers.dart';
import '../models/auth_output.dart';
import '../models/token.dart';
import '../models/usermodel.dart';
import '../usecases/login.dart';

ChangeNotifierProvider<SignUpProvider> signUpProvider =
    ChangeNotifierProvider((ref) => SignUpProvider(ref: ref));

class SignUpProvider extends ChangeNotifier {
  SignUpProvider({required this.ref});
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

  Future<bool> signUp(
    BuildContext context, {
    required SignupParams params,
    bool routeAfter = true,
  }) async {
    loading = true;
    final SignUp signUp = locator();
    final response = await signUp.call(
      params,
    );

    response.when(success: (User data) async {
      Helpers.logc(data);
      loading = false;
    }, failure: (error) {
      loading = false;
      final errorMessage = GQLExceptions.getErrorMessage(error);
      UI.showErrorSnack(
        navigatorKey.currentState!.context,
        errorMessage,
      );
    });
    return false;
  }

  void _updateGQLConfig(AuthOutput authOutput) {
    final GQLConfig gqlConfig = GQLConfig(
      'https://hightable-gateway-staging.herokuapp.com/',
      bearerToken: () async {
        final accessToken = authOutput.jwt;

        if (accessToken == null) {
          return '';
        } else {
          return accessToken;
        }
      },
    );
    locator.registerLazySingleton(
      () => ALGQLClient(gqlConfig),
    );
  }
}
