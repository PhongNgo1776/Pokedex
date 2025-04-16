import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_bloc.dart';
import 'package:phongngo.pokedex/route_paths.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/form_submission_status.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_state.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/widgets/login_button.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/widgets/password_field.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/widgets/user_name_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: BlocListener<AuthenticationBloc, LoginState>(
        listenWhen: (previous, current) =>
            previous.formStatus != current.formStatus,
        listener: (context, state) {
          final formStatus = state.formStatus;

          if (formStatus is SubmissionFailed) {
            _showSnackBar(context, formStatus.exception.toString());
          } else if (formStatus is SubmissionSuccess) {
            context.pushReplacement(RoutePaths.home);
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UsernameField(formKey: _formKey),
                  PasswordField(formKey: _formKey),
                  const SizedBox(height: 15),
                  LoginButton(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
