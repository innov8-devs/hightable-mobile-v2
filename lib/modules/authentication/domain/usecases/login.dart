import '../../../../core/al_flutter_core.dart';
import '../models/token.dart';
import '../params/login_params.dart';
import '../repo/auth_repo.dart';

class Login with UseCases<GQLResult<Token>, LoginParams> {
  Login(this._authRepo);

  final AuthRepo _authRepo;

  @override
  Future<GQLResult<Token>> call(LoginParams params) async =>
      _authRepo.login(params);
}
