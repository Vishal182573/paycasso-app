import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_auth_provider.dart';
import '../screens/beforeLogin/onboarding.dart';
import '../screens/afterLogin/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(
      builder: (context, authProvider, _) {
        // Temporarily bypass biometric auth for debugging
        return authProvider.isAuthenticated
          ? const HomeScreen()
          : const OnboardingScreen();
        
        // Original code with biometrics
        /*
        return FutureBuilder<bool>(
          future: authProvider.authenticateWithBiometrics(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.data == true) {
              return authProvider.isAuthenticated
                  ? const HomeScreen()
                  : const OnboardingScreen();
            }

            return const Scaffold(
              body: Center(
                child: Text('Biometric authentication required'),
              ),
            );
          },
        );
        */
      },
    );
  }
}
