import 'auth_provider.dart';
import 'auth_user.dart';
import 'firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

  factory AuthService.firebase() {
    return AuthService(FirebaseAuthProvider());
  }

  @override
  Future<void> initialize() {
    return provider.initialize();
  }

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) {
    return provider.createUser(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser {
    return provider.currentUser;
  }

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) {
    return provider.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return provider.logout();
  }

  @override
  Future<void> sendEmailVerification() {
    return provider.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordReset({required String toEmail}) async {
    return provider.sendPasswordReset(toEmail: toEmail);
  }
}
