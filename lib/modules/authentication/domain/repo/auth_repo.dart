import '../../../../core/al_flutter_core.dart';
import '../entities/user.dart';
import '../models/token.dart';
import '../models/usermodel.dart';
import '../params/login_params.dart';
import '../params/signup_params.dart';
import '../params/update_password_params.dart';

abstract class AuthRepo {
  ///
  Future<GQLResult<Token>> login(LoginParams params);
  Future<GQLResult<User>> verifyCustomer(num params);
  Future<GQLResult<User>> signup(SignupParams params);
  Future<GQLResult<User>> updateCustomerPassword(
    UpdatePasswordParams params,
  );

  Future<GQLResult<User>> customerPasswordReset(
    String params,
  );

  // ///
  // Future<GQLResult<OTPResponse>> signUp(SignUpParams params);

  // ///
  // Future<GQLResult<User>> validateAccountPin(String params);

  // ///
  // Future<GQLResult<AuthOutput>> validateOTP(OTPParams params);

  // ///
  // Future<GQLResult<User>> setAccountPin(String params);

  ///
  Future<GQLResult<User>> getUser();
}
