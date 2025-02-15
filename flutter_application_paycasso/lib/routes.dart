import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/followCommunity.dart';
import 'package:flutter_application_paycasso/screens/beforeLogin%20/onboarding.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String followCommunity = '/follow-community';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onboarding: (context) => const OnboardingScreen(),
      followCommunity: (context) => FollowSaaSPage(),
    };
  }
}
