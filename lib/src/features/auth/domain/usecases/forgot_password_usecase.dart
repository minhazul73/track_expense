import 'package:track_expense/src/core/utils/utils.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _repository;

  const ForgotPasswordUseCase(this._repository);

  FutureEither<void> call({required String email}) {
    return _repository.forgotPassword(email: email);
  }
}
