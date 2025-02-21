import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/followCommunity.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/homeScreen.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/paycassoCommunity.dart';
import 'package:flutter_application_paycasso/screens/beforeLogin/onboarding.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String followCommunity = '/follow-community';
  static const String home = '/home';
  static const String paycassoCommunity = '/paycasso-community';
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onboarding: (context) => const OnboardingScreen(),
      followCommunity: (context) => const FollowCommunity(),
      home: (context) => const HomeScreen(),
      paycassoCommunity: (context) => const PaycassoCommunity(),
    };
  }
}
