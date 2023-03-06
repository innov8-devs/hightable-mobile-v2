import '../../../../core/al_flutter_core.dart';
import '../repo/home_repo.dart';

class UnLikeReviews with UseCases<GQLResult, String> {
  UnLikeReviews(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  Future<GQLResult> call(String params) async =>
      _homeRepo.unLikeReviews(params);
}
