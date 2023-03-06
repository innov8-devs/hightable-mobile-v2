import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';

import '../../../../core/al_flutter_core.dart';
import '../repo/home_repo.dart';

class GetPeople with UseCases<GQLResult<List<User>>, NoParams> {
  GetPeople(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  Future<GQLResult<List<User>>> call(NoParams params) async =>
      _homeRepo.getPeople();
}
