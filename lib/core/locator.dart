import 'package:hightable_mobile_v2/modules/home/home_dependencies.dart';

import '../modules/authentication/auth_dependencies.dart';
import 'al_flutter_core.dart';

void setUpLocator(GQLConfig gqlConfig) {
  setupDI(gqlConfig);
  registerAutDependencies();
  registerHomeDependencies();
}
