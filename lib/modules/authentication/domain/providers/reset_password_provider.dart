// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/params/update_password_params.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/providers/signup_provider.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/usecases/update_customer_password.dart';
import 'package:hightable_mobile_v2/modules/authentication/views/screens/login_screen.dart';
import 'package:hightable_mobile_v2/modules/resetpassword/views/new-password.dart';
import 'package:hightable_mobile_v2/utils/custom_navigators.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';
import 'package:hightable_mobile_v2/utils/ui/helpers/otppage.dart';
import '../../../../core/config/config.dart';
import '../../../../core/service_exceptions/src/gql_exceptions.dart';
import '../../../../core/services/remote/al_gql_client.dart';
import '../../../../main.dart';
import '../../../../utils/ui/ui_helpers.dart';
import '../../../authentication/domain/models/usermodel.dart';
import '../usecases/customer_password_reset.dart';

ChangeNotifierProvider<ResetPasswordProvider> resetPasswordProvider =
    ChangeNotifierProvider((ref) => ResetPasswordProvider(ref: ref));

class ResetPasswordProvider extends ChangeNotifier {
  ResetPasswordProvider({required this.ref});
  Ref ref;
  bool _passVisible = false;
  bool _loading = false;
  bool requestState = false;

  bool get loading => _loading;
  bool get passVisible => _passVisible;

  set passVisible(bool state) {
    _passVisible = state;
    notifyListeners();
  }

  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }

  Future<bool> resetinit(
    BuildContext context, {
    required String params,
    bool routeAfter = true,
  }) async {
    loading = true;
    final CustomerPasswordReset resetinit = locator();
    final response = await resetinit.call(
      params,
    );
    response.when(success: (User data) async {
      loading = false;
      AppNavigators.routeReplacefade(
          context,
          OtpPage(
              route: NewPassword(
                code: "",
              ),
              routeNamee: "/reset_page",
              email: params));
      Helpers.logc(data);
      requestState = true;
    }, failure: (error) {
      loading = false;
      final errorMessage = GQLExceptions.getErrorMessage(error);
      UI.showErrorSnack(
        navigatorKey.currentState!.context,
        errorMessage,
      );
      requestState = false;
    });

    return requestState;
  }

  Future<bool> updatePassword(
    BuildContext context, {
    UpdatePasswordParams? params,
    bool routeAfter = true,
  }) async {
    loading = true;
    final UpdateCustomerPassword updatePass = locator();
    final response = await updatePass.call(
      params!,
    );

    response.when(success: (User data) async {
      loading = false;
      AppNavigators.routeReplacefade(context, const LoginScreen());
      Helpers.logc(data);
      requestState = true;
    }, failure: (error) {
      loading = false;
      final errorMessage = GQLExceptions.getErrorMessage(error);
      UI.showErrorSnack(
        navigatorKey.currentState!.context,
        errorMessage,
      );
      requestState = false;
    });

    return requestState;
  }
}
