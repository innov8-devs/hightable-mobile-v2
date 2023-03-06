import 'package:hightable_mobile_v2/core/al_flutter_core.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/resturant.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/event_model.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';
import 'package:hightable_mobile_v2/modules/home/domain/repo/home_repo.dart';
import 'package:hightable_mobile_v2/modules/home/repositories/datasource/home_datasource.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this._homeDatasource);

  final HomeDataSource _homeDatasource;

  @override
  Future<GQLResult<List<Event>>> getEvents() => gqlInterceptor(
        () => _homeDatasource.getEvents(),
      );

  @override
  Future<GQLResult<List<User>>> getPeople() => gqlInterceptor(
        () => _homeDatasource.getPeople(),
      );

  @override
  Future<GQLResult<List<Restaurant>>> getPlaces() => gqlInterceptor(
        () => _homeDatasource.getPlaces(),
      );

  @override
  Future<GQLResult<List<Review>>> getReviews() => gqlInterceptor(
        () => _homeDatasource.getReviews(),
      );

  @override
  Future<GQLResult> likeEvent(String params) => gqlInterceptor(
        () => _homeDatasource.likeEvent(params),
      );

  @override
  Future<GQLResult> likeReviews(String params) => gqlInterceptor(
        () => _homeDatasource.likeReviews(params),
      );

  @override
  Future<GQLResult> unLikeEvent(String params) => gqlInterceptor(
        () => _homeDatasource.unLikeEvent(params),
      );

  @override
  Future<GQLResult> unLikeReviews(String params) => gqlInterceptor(
        () => _homeDatasource.unLikeReviews(params),
      );
}
