import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';

import '../../../../core/al_flutter_core.dart';
import '../repo/home_repo.dart';

class GetReviews with UseCases<GQLResult<List<Review>>, NoParams> {
  GetReviews(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  Future<GQLResult<List<Review>>> call(NoParams params) async =>
      _homeRepo.getReviews();
}
