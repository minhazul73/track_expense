import 'package:track_expense/src/core/utils/utils.dart';
import 'package:track_expense/src/features/auth/domain/entities/user.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  const LoginUseCase(this._repository);

  FutureEither<AppUser> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}
