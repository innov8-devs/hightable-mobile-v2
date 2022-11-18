import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';

import '../../domain/entities/user.dart';
import '../../domain/models/token.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/signup_params.dart';
import '../../domain/params/update_password_params.dart';

abstract class AuthDatasource {
  ///
  Future<Token> login(LoginParams params);

  Future<User> verifyCustomer(num params);
  Future<User> signup(SignupParams params);
  Future<User> sendVerification(String params);
  Future<User> updateCustomerPassword(
    UpdatePasswordParams params,
  );

  Future<User> customerPasswordReset(
    String params,
  );

  ///
  Future<UserEntity> getUser();
}
