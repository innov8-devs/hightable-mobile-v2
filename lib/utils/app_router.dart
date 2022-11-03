import 'package:flutter/material.dart';

import '../modules/onboarding/views/screens/onboarding.dart';
import '../modules/onboarding/views/screens/splash_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  };
}
