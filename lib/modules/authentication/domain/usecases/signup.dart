import '../../../../core/al_flutter_core.dart';
import '../models/usermodel.dart';
import '../params/signup_params.dart';
import '../repo/auth_repo.dart';

class SignUp with UseCases<GQLResult<User>, SignupParams> {
  SignUp(this._authRepo);

  final AuthRepo _authRepo;

  @override
  Future<GQLResult<User>> call(SignupParams params) async =>
      _authRepo.signup(params);
}
