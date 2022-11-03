import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/modules/onboarding/views/screens/splash_screen.dart';
import 'package:hightable_mobile_v2/utils/app_router.dart';
import 'package:hightable_mobile_v2/utils/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
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
      title: 'Flutter Demo',
      routes: AppRouter.routes,
      theme: AppTheme.hightableTheme,
      initialRoute: SplashScreen.routeName,
      navigatorKey: navigatorKey,
    );
  }
}
