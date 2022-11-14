import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';

import '../../../../core/al_flutter_core.dart';
import '../entities/user.dart';
import '../repo/auth_repo.dart';

class GetUser with UseCases<GQLResult<User>, NoParams> {
  GetUser(this._authRepo);

  final AuthRepo _authRepo;

  @override
  Future<GQLResult<User>> call(NoParams params) async => _authRepo.getUser();
}
