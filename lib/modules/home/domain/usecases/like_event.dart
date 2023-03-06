import '../../../../core/al_flutter_core.dart';
import '../repo/home_repo.dart';

class LikeEvent with UseCases<GQLResult, String> {
  LikeEvent(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  Future<GQLResult> call(String params) async => _homeRepo.likeEvent(params);
}
