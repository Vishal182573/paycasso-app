import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/followCommunity.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/homeScreen.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/paycassoCommunity.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/profile/profileScreen.dart';
import 'package:flutter_application_paycasso/screens/beforeLogin/onboarding.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String followCommunity = '/follow-community';
  static const String home = '/home';
  static const String paycassoCommunity = '/paycasso-community';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      case followCommunity:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const FollowCommunity(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      case home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      case paycassoCommunity:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const PaycassoCommunity(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    }
  }

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onboarding: (context) => const OnboardingScreen(),
      followCommunity: (context) => const FollowCommunity(),
      home: (context) => const HomeScreen(),
      paycassoCommunity: (context) => const PaycassoCommunity(),
      profile: (context) => const ProfileScreen(),
    };
  }
}
