import 'dart:async';
import 'package:track_expense/src/core/imports/imports.dart';
import 'package:track_expense/src/features/auth/domain/entities/user.dart';
import 'package:track_expense/src/features/auth/domain/usecases/check_auth_state_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:track_expense/src/features/auth/domain/usecases/observe_auth_state_usecase.dart';
import 'package:track_expense/src/features/auth/presentation/providers/auth_dependencies.dart';

/// Provides a stream of auth state changes
final authStateStreamProvider = StreamProvider<AppUser?>((ref) {
  final useCase = ref.watch(observeAuthStateUseCaseProvider);
  return useCase();
});

/// Provides the current session state
final sessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) {
  return SessionNotifier(
    checkAuthState: ref.read(checkAuthStateUseCaseProvider),
    observeAuthState: ref.read(observeAuthStateUseCaseProvider),
    logout: ref.read(logoutUseCaseProvider),
  );
});

/// Session states
enum SessionStatus { unknown, authenticated, unauthenticated }

class SessionState {
  final SessionStatus status;
  final AppUser? user;

  const SessionState({this.status = SessionStatus.unknown, this.user});

  SessionState copyWith({SessionStatus? status, AppUser? user}) {
    return SessionState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}

class SessionNotifier extends StateNotifier<SessionState> {
  final CheckAuthStateUseCase _checkAuthState;
  final ObserveAuthStateUseCase _observeAuthState;
  final LogoutUseCase _logout;
  StreamSubscription<AppUser?>? _authSub;

  SessionNotifier({
    required CheckAuthStateUseCase checkAuthState,
    required ObserveAuthStateUseCase observeAuthState,
    required LogoutUseCase logout,
  })  : _checkAuthState = checkAuthState,
        _observeAuthState = observeAuthState,
        _logout = logout,
        super(const SessionState()) {
    _init();
  }

  Future<void> _init() async {
    // Check persisted session first
    final result = await _checkAuthState();
    result.fold(
      (_) => state = const SessionState(status: SessionStatus.unauthenticated),
      (user) {
        if (user != null) {
          state = SessionState(status: SessionStatus.authenticated, user: user);
        } else {
          state = const SessionState(status: SessionStatus.unauthenticated);
        }
      },
    );

    // Listen for future changes
    _authSub = _observeAuthState().listen((user) {
      if (user != null) {
        state = SessionState(status: SessionStatus.authenticated, user: user);
      } else {
        state = const SessionState(status: SessionStatus.unauthenticated);
      }
    });
  }

  Future<void> logout() async {
    await _logout();
    state = const SessionState(status: SessionStatus.unauthenticated);
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }
}

