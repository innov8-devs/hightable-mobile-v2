import 'package:hightable_mobile_v2/modules/home/domain/models/resturant.dart';

import '../../../../core/al_flutter_core.dart';
import '../repo/home_repo.dart';

class GetPlaces with UseCases<GQLResult<List<Restaurant>>, NoParams> {
  GetPlaces(this._accountRepo);

  final HomeRepo _accountRepo;

  @override
  Future<GQLResult<List<Restaurant>>> call(NoParams params) async =>
      _accountRepo.getPlaces();
}
