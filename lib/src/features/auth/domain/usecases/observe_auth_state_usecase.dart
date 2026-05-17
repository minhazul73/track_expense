import 'package:track_expense/src/features/auth/domain/entities/user.dart';
import 'package:track_expense/src/features/auth/domain/repositories/auth_repository.dart';

class ObserveAuthStateUseCase {
  final AuthRepository _repository;

  const ObserveAuthStateUseCase(this._repository);

  Stream<AppUser?> call() {
    return _repository.onAuthStateChanged;
  }
}
