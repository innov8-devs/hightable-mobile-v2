import 'package:hightable_mobile_v2/modules/home/domain/repo/home_repo.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/get_events.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/get_people.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/get_places.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/get_reviews.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/like_event.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/like_review.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/unlike_event.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/unlike_review.dart';
import 'package:hightable_mobile_v2/modules/home/repositories/datasource/home_datasource.dart';
import 'package:hightable_mobile_v2/modules/home/repositories/datasource/impl/home_datasource_impl.dart';
import 'package:hightable_mobile_v2/modules/home/repositories/home_repo_impl.dart';

import '../../../core/config/DI/di.dart';

void registerHomeDependencies() {
  ///[DataSources].
  locator.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(
      locator(),
    ),
  );

  locator.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      locator(),
    ),
  );

  locator.registerLazySingleton<GetReviews>(
    () => GetReviews(
      locator(),
    ),
  );

  locator.registerLazySingleton<GetEvents>(
    () => GetEvents(
      locator(),
    ),
  );

  locator.registerLazySingleton<GetPeople>(
    () => GetPeople(
      locator(),
    ),
  );

  locator.registerLazySingleton<GetPlaces>(
    () => GetPlaces(
      locator(),
    ),
  );

  locator.registerLazySingleton<LikeEvent>(
    () => LikeEvent(
      locator(),
    ),
  );

  locator.registerLazySingleton<LikeReviews>(
    () => LikeReviews(
      locator(),
    ),
  );

  locator.registerLazySingleton<UnLikeEvent>(
    () => UnLikeEvent(
      locator(),
    ),
  );

  locator.registerLazySingleton<UnLikeReviews>(
    () => UnLikeReviews(
      locator(),
    ),
  );
}
