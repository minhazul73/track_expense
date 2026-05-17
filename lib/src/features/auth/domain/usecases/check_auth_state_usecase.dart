import 'package:track_expense/src/core/utils/utils.dart';
import 'package:track_expense/src/features/auth/domain/entities/user.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthStateUseCase {
  final AuthRepository _repository;

  const CheckAuthStateUseCase(this._repository);

  FutureEither<AppUser?> call() {
    return _repository.checkAuthState();
  }
}
