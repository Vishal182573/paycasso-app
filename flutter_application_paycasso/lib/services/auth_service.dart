import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LocalAuthentication? _localAuth;

  AuthService() {
    try {
      _localAuth = LocalAuthentication();
    } catch (e) {
      print('Failed to initialize LocalAuthentication: $e');
      // Leave _localAuth as null
    }
  }

  // Check if user is logged in
  bool get isLoggedIn => _auth.currentUser != null;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Check and authenticate with biometrics
  Future<bool> authenticateWithBiometrics() async {
    try {
      // Initialize if not already done
      _localAuth ??= LocalAuthentication();
      
      // Null check before using
      if (_localAuth == null) {
        print('LocalAuthentication not available');
        return false;
      }
      
      final bool canAuthenticateWithBiometrics =
          await _localAuth!.canCheckBiometrics;
      if (!canAuthenticateWithBiometrics) {
        return false;
      }

      return await _localAuth!.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } catch (e) {
      print('Error using biometrics: $e');
      return false;
    }
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      // First authenticate with biometrics
      final bool didAuthenticate = await authenticateWithBiometrics();
      if (!didAuthenticate) {
        throw Exception('Biometric authentication failed');
      }

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
