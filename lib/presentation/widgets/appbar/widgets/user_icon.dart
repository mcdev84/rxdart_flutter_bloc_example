import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigin/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/presentation/authentication/signin/sign_in_view.dart';

class UserThumb extends StatelessWidget {
  const UserThumb({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) => IconButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent)),
            onPressed: () => state.status == AuthenticationStatus.authenticated
                ? context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationEventSignOut())
                : context.go(SignInPage.routeName),
            icon: state.status == AuthenticationStatus.authenticated
                ? Image(fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    image: Image.network(
                      state.user.image!,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.no_accounts_outlined),
                      fit: BoxFit.scaleDown,
                      cacheHeight: (appBarSize.height * .5).toInt(),
                      cacheWidth: (appBarSize.height * .5).toInt(),
                    ).image,
                  )
                : const Icon(Icons.no_accounts_outlined)),
      );
}
