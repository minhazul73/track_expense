import 'package:track_expense/src/core/utils/utils.dart';
import 'package:track_expense/src/features/auth/domain/entities/user.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  const SignUpUseCase(this._repository);

  FutureEither<AppUser> call({
    required String name,
    required String email,
    required String password,
  }) {
    return _repository.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}
