import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart' as provider;
import 'providers/app_auth_provider.dart';
import 'widgets/auth_gate.dart';

import 'routes.dart';
import 'screens/beforeLogin/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Check if Firebase is already initialized before initializing
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return provider.ChangeNotifierProvider(
      create: (_) => AppAuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paycasso',
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const AuthGate(),
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return const OnboardingScreen();
      },
    );
  }
}
