import '../../../../core/al_flutter_core.dart';
import '../models/usermodel.dart';
import '../repo/auth_repo.dart';

class CustomerPasswordReset with UseCases<GQLResult<User>, String> {
  CustomerPasswordReset(this._authRepo);

  final AuthRepo _authRepo;

  @override
  Future<GQLResult<User>> call(String params) async =>
      _authRepo.customerPasswordReset(params);
}
