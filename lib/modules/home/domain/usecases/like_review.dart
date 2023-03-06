import '../../../../core/al_flutter_core.dart';
import '../repo/home_repo.dart';

class LikeReviews with UseCases<GQLResult, String> {
  LikeReviews(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  Future<GQLResult> call(String params) async => _homeRepo.likeReviews(params);
}
