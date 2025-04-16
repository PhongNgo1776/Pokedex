import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_bloc.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_event.dart';
import 'package:phongngo.pokedex/route_paths.dart';
import 'package:phongngo.pokedex/themes/border_radiuses.dart';
import 'package:phongngo.pokedex/themes/offsets.dart';
import 'package:pull_down_button/pull_down_button.dart';

class AvatarButton extends StatelessWidget {
  const AvatarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userName = context.read<AuthenticationBloc>().state.user?.name ?? '';
    final firstLetter = userName.isNotEmpty ? userName[0].toUpperCase() : '';
    return PullDownButton(
      itemBuilder: (context) => [
        PullDownMenuItem(
          title: 'Logout',
          onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.read<AuthenticationBloc>().add(LogoutEvent());
                          context.pushReplacement(RoutePaths.login);
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                    ],
                  )),
        ),
      ],
      buttonBuilder: (context, showMenu) => InkWell(
        borderRadius: roundedXxl,
        onTap: showMenu,
        child: Container(
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
      ),
    );
  }
}
