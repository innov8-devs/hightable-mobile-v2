import 'package:hightable_mobile_v2/utils/helpers.dart';

import '../../../../../core/al_flutter_core.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/models/token.dart';
import '../../../domain/models/usermodel.dart';
import '../../../domain/params/login_params.dart';
import '../../../domain/params/signup_params.dart';
import '../../../domain/params/update_password_params.dart';
import '../../graphql/mutations.dart';
import '../../graphql/queries.dart';
import '../auth_datasource.dart';

class AuthDatasourceImpl extends AuthDatasource {
  AuthDatasourceImpl(this._algqlClient);

  final ALGQLClient _algqlClient;

  @override
  Future<Token> login(LoginParams params) async {
    final response = await _algqlClient.gpMutate(
      mutationDocument: mutateLogin(),
      data: {
        'customer': params.toMap(),
      },
    );
    return Token.fromMap(
        response.data?['loginCustomer'] as Map<String, dynamic>);
  }

  @override
  Future<UserEntity> customerPasswordReset(String params) {
    // TODO: implement customerPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User> signup(SignupParams params) async {
    final response = await _algqlClient.gpMutate(
      mutationDocument: mutateSignUp,
      data: {
        'customer': params.toMap(),
      },
    );
    Helpers.logc(response.data!);
    return User.fromMap(
        response.data!['createCustomer']['customer'] as Map<String, dynamic>);
  }

  @override
  Future<User> sendVerification(String params) async {
    final response = await _algqlClient.gpQuery(
      queryDocument: querysendVerification,
      data: {
        'email': params,
      },
    );
    Helpers.logc(response.data!);
    return User.fromMap(response.data!['sendCustomerVerification']);
  }

  @override
  Future<UserEntity> updateCustomerPassword(UpdatePasswordParams params) {
    // TODO: implement updateCustomerPassword
    throw UnimplementedError();
  }

  @override
  Future<User> verifyCustomer(num params) async {
    final response = await _algqlClient.gpQuery(
      queryDocument: queryVerifyCustomer,
      data: {
        'code': params,
      },
    );
    return User.fromMap(
        response.data!['verifyCustomer'] as Map<String, dynamic>);
  }

  // @override
  // Future<User> getUser() async {
  //   final response = await _algqlClient.gpQuery(
  //     queryDocument: queryGetUser,
  //     data: {
  //       'customer': {},
  //     },
  //   );
  //   return User.fromMap(
  //       response.data!['findOneCustomer'] as Map<String, dynamic>);
  // }

  // @override
  // Future<User> customerPasswordReset(String params) async {
  //   final response = await _algqlClient.gpQuery(
  //     queryDocument: queryCustomerPasswordReset,
  //     data: {
  //       'email': params,
  //     },
  //   );
  //   return User.fromMap(
  //       response.data!['customerPasswordReset'] as Map<String, dynamic>);
  // }

  // @override
  // Future<User> signup(SignupParams params) async {
  //   final response = await _algqlClient.gpMutate(
  //     mutationDocument: mutateSignUp,
  //     data: {
  //       'customer': params.toMap(),
  //     },
  //   );
  //   return User.fromMap(
  //       response.data!['createCustomer'] as Map<String, dynamic>);
  // }

  // @override
  // Future<User> updateCustomerPassword(UpdatePasswordParams params) async {
  //   final response = await _algqlClient.gpMutate(
  //     mutationDocument: mutateUpdateCustomerPassword,
  //     data: params.toMap(),
  //   );
  //   return User.fromMap(
  //       response.data!['updateCustomerPassword'] as Map<String, dynamic>);
  // }

}
