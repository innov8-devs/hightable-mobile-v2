import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/event_model.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/resturant.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';

import '../../../../core/al_flutter_core.dart';

abstract class HomeRepo {
  Future<GQLResult<List<Restaurant>>> getPlaces();
  Future<GQLResult<List<Event>>> getEvents();
  Future<GQLResult<List<Review>>> getReviews();
  Future<GQLResult<List<User>>> getPeople();
  Future<GQLResult> likeEvent(String params);
  Future<GQLResult> unLikeEvent(String params);
  Future<GQLResult> likeReviews(String params);
  Future<GQLResult> unLikeReviews(String params);
}
