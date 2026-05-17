import 'package:fpdart/fpdart.dart';

import 'package:track_expense/src/core/utils/utils.dart';
import 'package:track_expense/src/features/auth/data/models/user_model.dart';
import 'package:track_expense/src/features/auth/data/services/auth_remote_service.dart';
import 'package:track_expense/src/features/auth/domain/entities/user.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({AuthRemoteService? remoteService})
  : _remoteService = remoteService ?? AuthRemoteServiceImpl();

  final AuthRemoteService _remoteService;

  @override
  Stream<AppUser?> get onAuthStateChanged {
    return _remoteService.authStateChanges.map((userData) {
      if (userData == null) return null;
      return AppUserModel.fromMap(userData).toEntity();
    });
  }

  @override
  FutureEither<AppUser> login({
    required String email, 
    required String password,
  }) async {
    final result = await _remoteService.login(email: email, password: password);
    
    return result.flatMap((userData) {
      if (userData == null) {
        return left(const ServerFailure('Login failed: User record not found'));
      }

      final user = AppUserModel.fromMap(userData).toEntity();
      
      return right(user);
    });
  }

  @override
  FutureEither<AppUser> signUp({
    required String name, 
    required String email, 
    required String password,
  }) async {
    final result = await _remoteService.signUp(
      name: name,
      email: email,
      password: password,
    );

    return result.flatMap((userData) {
      if (userData == null) {
        return left(const ServerFailure('Sign up failed: User record corrupted'));
      }

      final user = AppUserModel.fromMap(userData).toEntity();
      
      return right(user);
    });
  }

  @override
  FutureEither<void> forgotPassword({required String email}) {
    return _remoteService.forgotPassword(email: email);
  }

  @override
  FutureEither<void> logout() {
    return _remoteService.logout();
  }

  @override
  FutureEither<AppUser?> checkAuthState() async {
    final result = await _remoteService.getCurrentUser();
    
    return result.map((userData) {
      if (userData == null) return null;

      return AppUserModel.fromMap(userData).toEntity();
    });
  }
}
