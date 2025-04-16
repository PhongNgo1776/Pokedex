import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_event.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_helper.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_state.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          key: const Key('usernameField'),
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Username',
          ),
          validator: (value) => LoginHelper.isValidUsername(value)
              ? null
              : 'Username is too short',
          onChanged: (value) {
            formKey.currentState?.validate();
            context.read<LoginBloc>().add(
                  LoginUsernameChanged(username: value),
                );
          },
        );
      },
    );
  }
}
