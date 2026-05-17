import 'package:track_expense/src/core/services/auth_service.dart';
import 'package:track_expense/src/core/utils/utils.dart';

abstract class AuthRemoteService {
  Stream<Map<String, dynamic>?> get authStateChanges;

  FutureEither<Map<String, dynamic>?> login({
    required String email,
    required String password,
  });

  FutureEither<Map<String, dynamic>?> signUp({
    required String name,
    required String email,
    required String password,
  });

  FutureEither<void> forgotPassword({required String email});

  FutureEither<void> logout();

  FutureEither<Map<String, dynamic>?> getCurrentUser();
}

class AuthRemoteServiceImpl implements AuthRemoteService {
  AuthRemoteServiceImpl({AuthService? authService})
      : _authService = authService ?? AuthService.instance;

  final AuthService _authService;

  @override
  Stream<Map<String, dynamic>?> get authStateChanges =>
      _authService.authStateChanges;

  @override
  FutureEither<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) {
    return _authService.login(email: email, password: password);
  }

  @override
  FutureEither<Map<String, dynamic>?> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    return _authService.signUp(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  FutureEither<void> forgotPassword({required String email}) {
    return _authService.forgotPassword(email: email);
  }

  @override
  FutureEither<void> logout() {
    return _authService.logout();
  }

  @override
  FutureEither<Map<String, dynamic>?> getCurrentUser() {
    return _authService.getCurrentUser();
  }
}
