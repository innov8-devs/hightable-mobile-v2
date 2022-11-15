import 'package:hightable_mobile_v2/modules/authentication/domain/usecases/sendVerification.dart';

import '../../../../core/al_flutter_core.dart';
import '../domain/entities/user.dart';
import '../domain/models/token.dart';
import '../domain/models/usermodel.dart';
import '../domain/params/login_params.dart';
import '../domain/params/signup_params.dart';
import '../domain/params/update_password_params.dart';
import '../domain/repo/auth_repo.dart';
import 'datasource/auth_datasource.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this._authDatasource);

  final AuthDatasource _authDatasource;

  @override
  Future<GQLResult<User>> getUser() => gqlInterceptor(
        () => _authDatasource.getUser(),
      );
  @override
  Future<GQLResult<Token>> login(LoginParams params) => gqlInterceptor(
        () => _authDatasource.login(params),
      );

  @override
  Future<GQLResult<User>> customerPasswordReset(String params) =>
      gqlInterceptor(
        () => _authDatasource.customerPasswordReset(params),
      );

  @override
  Future<GQLResult<User>> signup(SignupParams params) => gqlInterceptor(
        () => _authDatasource.signup(params),
      );
  @override
  Future<GQLResult<User>> sendVerification(String params) => gqlInterceptor(
        () => _authDatasource.sendVerification(params),
      );
  @override
  Future<GQLResult<User>> updateCustomerPassword(UpdatePasswordParams params) =>
      gqlInterceptor(
        () => _authDatasource.updateCustomerPassword(params),
      );

  @override
  Future<GQLResult<User>> verifyCustomer(num params) => gqlInterceptor(
        () => _authDatasource.verifyCustomer(params),
      );
}
