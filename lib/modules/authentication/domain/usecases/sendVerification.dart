import '../../../../core/al_flutter_core.dart';
import '../models/usermodel.dart';
import '../repo/auth_repo.dart';

class sendVerification with UseCases<GQLResult<User>, String> {
  sendVerification(this._authRepo);

  final AuthRepo _authRepo;

  @override
  Future<GQLResult<User>> call(String params) async =>
      _authRepo.sendVerification(params);
}
