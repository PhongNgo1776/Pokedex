import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_bloc.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_event.dart';
import 'package:phongngo.pokedex/screens/login_screen/domain/login_use_case.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/form_submission_status.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_event.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final AuthenticationBloc _authenticationBloc;

  LoginBloc({
    required LoginUseCase loginUseCase,
    required AuthenticationBloc authenticationBloc,
  })  : _loginUseCase = loginUseCase,
        _authenticationBloc = authenticationBloc,
        super(LoginState()) {
    on<LoginEvent>(
        (event, emit) async => await _mapLoginEventToState(event, emit));
  }

  Future _mapLoginEventToState(
      LoginEvent event, Emitter<LoginState> emit) async {
    // Username updated
    if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));

      // Password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        final result = await _loginUseCase.execute(
          userName: state.username,
          password: state.password,
        );

        result.fold(
            (error) => emit(
                state.copyWith(formStatus: SubmissionFailed(result.getLeft()))),
            (userEntity) {
          _authenticationBloc.add(
            AuthenticationLoggedIn(userEntity: userEntity),
          );
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        });
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
