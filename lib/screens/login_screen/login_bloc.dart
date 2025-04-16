import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/form_submission_status.dart';
import 'package:phongngo.pokedex/screens/login_screen/login_event.dart';
import 'package:phongngo.pokedex/screens/login_screen/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String? authRepo;

  LoginBloc({this.authRepo}) : super(const LoginState()) {
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
        // await authRepo?.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
