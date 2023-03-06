import 'package:hightable_mobile_v2/core/al_flutter_core.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/resturant.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/event_model.dart';
import 'package:hightable_mobile_v2/modules/home/repositories/datasource/home_datasource.dart';
import 'package:hightable_mobile_v2/modules/home/repositories/graphql/mutations.dart';
import 'package:hightable_mobile_v2/modules/home/repositories/graphql/queries.dart';

class HomeDataSourceImpl extends HomeDataSource {
  HomeDataSourceImpl(this._algqlClient);

  final ALGQLClient _algqlClient;

  @override
  Future<List<Event>> getEvents() async {
    final response = await _algqlClient.gpQuery(
      queryDocument: queryRecommendedEvents,
      data: {},
    );
    return (response.data!['recommendEvents'] as List?)
            ?.map((data) => Event.fromMap(data))
            .toList() ??
        [];
  }

  @override
  Future<List<Restaurant>> getPlaces() async {
    final response = await _algqlClient.gpQuery(
      queryDocument: queryRecommendedResturants,
      data: {},
    );
    return (response.data!['recommendRestaurants'] as List?)
            ?.map((data) => Restaurant.fromMap(data))
            .toList() ??
        [];
  }

  @override
  Future<List<Review>> getReviews() async {
    final response = await _algqlClient.gpQuery(
      queryDocument: queryReviews,
      data: {"data": {}},
    );
    return (response.data!['findReviews'] as List?)
            ?.map((data) => Review.fromMap(data))
            .toList() ??
        [];
  }

  @override
  Future likeEvent(String params) async {
    final response = await _algqlClient.gpQuery(
      queryDocument: mutateLikeEvent,
      data: {
        'id': params,
      },
    );
    return response.data?['likeEvent'];
  }

  @override
  Future likeReviews(String params) async {
    final response = await _algqlClient.gpQuery(
      queryDocument: mutateLikeReview,
      data: {
        'id': params,
      },
    );
    return response.data?['likeReview'];
  }

  @override
  Future unLikeEvent(String params) async {
    final response = await _algqlClient.gpQuery(
      queryDocument: mutateUnlikeEvent,
      data: {
        'id': params,
      },
    );
    return response.data?['unlikeEvent'];
  }

  @override
  Future unLikeReviews(String params) async {
    final response = await _algqlClient.gpQuery(
      queryDocument: mutateUnlikeReviews,
      data: {
        'id': params,
      },
    );
    return response.data?['unlikeReview'];
  }
}
