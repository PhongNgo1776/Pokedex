import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/authentication/domain/load_user_use_case.dart';
import 'package:phongngo.pokedex/core/authentication/domain/logout_use_case.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_event.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LogOutUseCase _logOutUseCase;

  AuthenticationBloc(
      {required LoadUserUseCase loadUserUseCase,
      required LogOutUseCase logOutUseCase})
      : _logOutUseCase = logOutUseCase,
        super(AuthenticationState(user: loadUserUseCase.execute())) {
    on<LogoutEvent>(_logout);
    on<AuthenticationLoggedIn>(_loggedIn);
  }
  void _loggedIn(
    AuthenticationLoggedIn event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(user: event.userEntity));
  }

  Future<void> _logout(
    LogoutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _logOutUseCase.execute();
    emit(state.copyWith(user: null));
  }
}
