import 'package:hightable_mobile_v2/modules/home/domain/models/event_model.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/resturant.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';

abstract class HomeDataSource {
  Future<List<Review>> getReviews();
  Future<List<Event>> getEvents();
  Future<List<Restaurant>> getPlaces();
  Future<List<Restaurant>> getPeople();
  Future likeEvent(String params);
  Future unLikeEvent(String params);
  Future likeReviews(String params);
  Future unLikeReviews(String params);
}
