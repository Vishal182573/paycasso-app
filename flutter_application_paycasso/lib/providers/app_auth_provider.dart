import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppAuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isAuthenticated = false;

  AppAuthProvider() {
    _init();
  }

  void _init() {
    _user = _authService.currentUser;
    _isAuthenticated = _user != null;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      _isAuthenticated = user != null;
      notifyListeners();
    });
  }

  bool get isAuthenticated => _isAuthenticated;
  User? get user => _user;

  Future<bool> authenticateWithBiometrics() async {
    final result = await _authService.authenticateWithBiometrics();
    notifyListeners();
    return result;
  }

  Future<bool> signInWithGoogle() async {
    final user = await _authService.signInWithGoogle();
    _user = user;
    _isAuthenticated = user != null;
    notifyListeners();
    return user != null;
  }

  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await logout();
  }
}
