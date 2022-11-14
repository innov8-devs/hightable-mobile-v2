import 'dart:developer';

import '../../al_flutter_core.dart';

Future<GQLResult<T>> gqlInterceptor<T>(
  Function() func,
) async {
  final networkInfo = NetworkInfoImpl(locator());
  if (await networkInfo.isDeviceConnected) {
    try {
      final result = await func() as T;
      return GQLResult.success(data: result);
    } catch (exception, s) {
      log(exception.toString());
      log(s.toString());
      return GQLResult.failure(
        error: GQLExceptions.getGQLException(exception),
      );
    }
  } else {
    return const GQLResult.failure(
      error: GQLExceptions.noInternetConnection(),
    );
  }
}
