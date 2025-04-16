import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_bloc.dart';
import 'package:phongngo.pokedex/themes/offsets.dart';
import 'package:pull_down_button/pull_down_button.dart';

class AvatarButton extends StatelessWidget {
  const AvatarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userName = context.read<AuthenticationBloc>().state.username;
    final firstLetter = userName.isNotEmpty ? userName[0].toUpperCase() : '';
    return PullDownButton(
      itemBuilder: (context) => [
        PullDownMenuItem(
          title: 'Logout',
          onTap: () {},
        ),
      ],
      buttonBuilder: (context, _) => Container(
        padding: allInsetsBase,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Text(firstLetter),
      ),
    );
  }
}
