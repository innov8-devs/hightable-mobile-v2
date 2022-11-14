import '../../../../core/al_flutter_core.dart';
import '../models/usermodel.dart';
import '../repo/auth_repo.dart';

class VerifyCustomer with UseCases<GQLResult<User>, num> {
  VerifyCustomer(this._authRepo);

  final AuthRepo _authRepo;

  @override
  Future<GQLResult<User>> call(num params) async =>
      _authRepo.verifyCustomer(params);
}
