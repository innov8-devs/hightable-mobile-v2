import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hightable_mobile_v2/core/locator.dart';
import 'package:hightable_mobile_v2/modules/onboarding/views/screens/splash_screen.dart';
import 'package:hightable_mobile_v2/utils/app_router.dart';
import 'package:hightable_mobile_v2/utils/constants.dart';
import 'package:hightable_mobile_v2/utils/ui/theme.dart';

import 'core/config/config.dart';
import 'core/db/user_db.dart';
import 'core/services/local/hive_service.dart';
import 'modules/authentication/domain/models/auth_output.dart';
import 'modules/authentication/domain/models/usermodel.dart';

Future<AuthOutput?> _getAuthenticationDetails() async {
  final userInstance = UserDb.getInstance();
  log("User Instance ${userInstance?.accessToken}");
  return AuthOutput(
    user: userInstance?.user,
    expires: '',
    jwt: userInstance?.accessToken,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await initHive();
  await initHiveForFlutter();
  await HiveService.registerAdapter(
    UserAdapter(),
  );
  // await HiveService.registerAdapter(
  //   PreferencesAdapter(),
  // );
  await HiveService.openBox(AppConstants.boxOnBoarding);
  await HiveService.openBox(AppConstants.boxUserDetails);
  await HiveService.openBox(AppConstants.boxPreferences);
  await HiveService.openBox(AppConstants.boxUserSession);

  final HttpLink httpLink = HttpLink(
    'https://gateway-dev.hightable.africa/',
  );
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  final AuthOutput? authOutput = await _getAuthenticationDetails();

  final GQLConfig gqlConfig = GQLConfig(
    'https://gateway-dev.hightable.africa',
    bearerToken: () async {
      print("AuthOutput $authOutput");
      final accessToken = authOutput?.jwt;

      if (accessToken == null) {
        return '';
      } else {
        return accessToken;
      }
    },
  );

  setUpLocator(gqlConfig);

  runApp(
    GraphQLProvider(
      client: client,
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      title: 'HighTable',
      routes: AppRouter.routes,
      theme: AppTheme.hightableTheme,
      initialRoute: SplashScreen.routeName,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
