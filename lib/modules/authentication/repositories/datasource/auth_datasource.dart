import '../../domain/entities/user.dart';
import '../../domain/models/token.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/signup_params.dart';
import '../../domain/params/update_password_params.dart';

abstract class AuthDatasource {
  ///
  Future<Token> login(LoginParams params);

  Future<UserEntity> verifyCustomer(num params);
  Future<UserEntity> signup(SignupParams params);
  Future<UserEntity> updateCustomerPassword(
    UpdatePasswordParams params,
  );

  Future<UserEntity> customerPasswordReset(
    String params,
  );

  ///
  Future<UserEntity> getUser();
}
