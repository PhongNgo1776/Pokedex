import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/domain/login_use_case.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/form_submission_status.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_event.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_state.dart';

class AuthenticationBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  AuthenticationBloc({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
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
        await _loginUseCase.execute(
          userName: state.username,
          password: state.password,
        );

        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
