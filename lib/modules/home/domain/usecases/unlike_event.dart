import '../../../../core/al_flutter_core.dart';
import '../repo/home_repo.dart';

class UnLikeEvent with UseCases<GQLResult, String> {
  UnLikeEvent(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  Future<GQLResult> call(String params) async => _homeRepo.unLikeEvent(params);
}
