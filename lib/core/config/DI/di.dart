import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:get_it/get_it.dart';

import '../../al_flutter_core.dart';

GetIt locator = GetIt.I;

///Enusre [setupDI] is called in main directory.
void setupDI(GQLConfig gqlConfig) {
  locator.allowReassignment = true;

  ///Internet connection dependencies.
  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      locator(),
    ),
  );

  ///[API service dependencies].

  locator.registerLazySingleton(
    () => ALGQLClient(gqlConfig),
  );
}
