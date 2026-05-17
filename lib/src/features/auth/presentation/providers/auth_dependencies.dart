import 'package:track_expense/src/core/imports/packages_imports.dart';
import 'package:track_expense/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:track_expense/src/features/auth/data/services/auth_remote_service.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:track_expense/src/features/auth/domain/usecases/check_auth_state_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/observe_auth_state_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/signup_usecase.dart';

final authRemoteServiceProvider = Provider<AuthRemoteService>((ref) {
  return AuthRemoteServiceImpl();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteService: ref.read(authRemoteServiceProvider),
  );
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.read(authRepositoryProvider));
});

final forgotPasswordUseCaseProvider = Provider<ForgotPasswordUseCase>((ref) {
  return ForgotPasswordUseCase(ref.read(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.read(authRepositoryProvider));
});

final checkAuthStateUseCaseProvider = Provider<CheckAuthStateUseCase>((ref) {
  return CheckAuthStateUseCase(ref.read(authRepositoryProvider));
});

final observeAuthStateUseCaseProvider = Provider<ObserveAuthStateUseCase>((ref) {
  return ObserveAuthStateUseCase(ref.read(authRepositoryProvider));
});
