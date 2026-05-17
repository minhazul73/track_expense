import 'package:track_expense/src/core/imports/core_imports.dart';
import 'package:track_expense/src/core/imports/packages_imports.dart';

import 'package:track_expense/src/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/signup_usecase.dart';
import 'package:track_expense/src/features/auth/presentation/providers/auth_dependencies.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    loginUseCase: ref.read(loginUseCaseProvider),
    signUpUseCase: ref.read(signUpUseCaseProvider),
    forgotPasswordUseCase: ref.read(forgotPasswordUseCaseProvider),
  );
});

class AuthController extends StateNotifier<bool> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  AuthController({
    required LoginUseCase loginUseCase,
    required SignUpUseCase signUpUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
  })  : _loginUseCase = loginUseCase,
        _signUpUseCase = signUpUseCase,
        _forgotPasswordUseCase = forgotPasswordUseCase,
        super(false); // loading state is false

  void login({required BuildContext context, required String email, required String password}) async {
    state = true;
    
    final result = await _loginUseCase(email: email, password: password);
    
    state = false;
    result.fold(
      (failure) {
        if (context.mounted) {
          showToast(context, message: failure.message, status: 'error');
        }
      },
      (user) {
        if (rootContext?.mounted ?? false) {
          rootContext!.go(AppRoutes.home);
        }
      },
    );
  }

  void signUp({required BuildContext context, required String name, required String email, required String password}) async {
    state = true;
    
    final result = await _signUpUseCase(
      name: name,
      email: email,
      password: password,
    );
    
    state = false;
    result.fold(
      (failure) {
        if (context.mounted) {
          showToast(context, message: failure.message, status: 'error');
        }
      },
      (user) {
        if (rootContext?.mounted ?? false) {
          rootContext!.go(AppRoutes.home);
        }
      },
    );
  }

  void forgotPassword({required BuildContext context, required String email}) async {
    state = true;
    
    final result = await _forgotPasswordUseCase(email: email);

    state = false;
    result.fold(
      (failure) {
        if (context.mounted) {
          showToast(context, message: failure.message, status: 'error');
        }
      },
      (success) {
        if (context.mounted) {
          showToast(context, message: 'Password reset link sent successfully', status: 'success');
        }
        if (context.mounted) {
          context.go(AppRoutes.login);
        }
      },
    );
  }
}

