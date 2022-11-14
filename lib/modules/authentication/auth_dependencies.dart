import '../../../core/config/DI/di.dart';
import 'domain/repo/auth_repo.dart';
import 'domain/usecases/get_user.dart';
import 'domain/usecases/login.dart';
import 'domain/usecases/signup.dart';
import 'repositories/auth_repo_impl.dart';
import 'repositories/datasource/auth_datasource.dart';
import 'repositories/datasource/impl/auth_datasource_impl.dart';

void registerAutDependencies() {
  ///[DataSources].
  locator.registerLazySingleton<AuthDatasource>(
    () => AuthDatasourceImpl(
      locator(),
    ),
  );
  locator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      locator(),
    ),
  );
  locator.registerLazySingleton<SignUp>(
    () => SignUp(
      locator(),
    ),
  );

  locator.registerLazySingleton<Login>(
    () => Login(
      locator(),
    ),
  );
  // locator.registerLazySingleton<VerifyCustomer>(
  //   () => VerifyCustomer(
  //     locator(),
  //   ),
  // );
  // locator.registerLazySingleton<SetAccountPin>(
  //   () => SetAccountPin(
  //     locator(),
  //   ),
  // );
  locator.registerLazySingleton<GetUser>(
    () => GetUser(
      locator(),
    ),
  );
}