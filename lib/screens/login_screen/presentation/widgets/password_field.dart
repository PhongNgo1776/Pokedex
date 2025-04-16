import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_event.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_helper.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_state.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.password != current.password,
      listener: (context, state) {
        Future(() => formKey.currentState?.validate());
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.key),
            hintText: 'Password',
          ),
          validator: (value) => LoginHelper.isValidPassword(value)
              ? null
              : 'Password is too short',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(password: value),
              ),
        );
      }),
    );
  }
}
