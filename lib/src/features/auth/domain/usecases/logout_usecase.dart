import 'package:track_expense/src/core/utils/utils.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  const LogoutUseCase(this._repository);

  FutureEither<void> call() {
    return _repository.logout();
  }
}
