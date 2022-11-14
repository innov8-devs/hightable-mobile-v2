import '../../../../core/al_flutter_core.dart';
import '../models/usermodel.dart';
import '../params/update_password_params.dart';
import '../repo/auth_repo.dart';

class UpdateCustomerPassword
    with UseCases<GQLResult<User>, UpdatePasswordParams> {
  UpdateCustomerPassword(this._authRepo);

  final AuthRepo _authRepo;

  @override
  Future<GQLResult<User>> call(UpdatePasswordParams params) async =>
      _authRepo.updateCustomerPassword(params);
}
