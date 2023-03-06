import 'package:hightable_mobile_v2/core/al_flutter_core.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/event_model.dart';
import 'package:hightable_mobile_v2/modules/home/domain/repo/home_repo.dart';

class GetEvents with UseCases<GQLResult<List<Event>>, NoParams> {
  GetEvents(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  Future<GQLResult<List<Event>>> call(NoParams params) async =>
      _homeRepo.getEvents();
}
