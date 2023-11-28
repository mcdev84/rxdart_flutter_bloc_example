import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/presentation/authentication/signin/signin.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: context.read<AuthenticationBloc>().authenticationSubject,
      builder: (context, snapshot) => IconButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => lightGrey)),
          onPressed: () {},
          icon: snapshot.data?.status == AuthenticationStatus.authenticated
              ? Image(
                  image: Image.network(
                    snapshot.data!.user!.image!,
                    fit: BoxFit.scaleDown,
                   cacheHeight: (appBarSize.height* .5).toInt(),
                    cacheWidth: (appBarSize.height*.5).toInt(),
                  ).image,
                )
              : IconButton(
              onPressed: () => context.push(SignInPage.routeName),
              icon: const Icon(Icons.no_accounts_outlined))));
}
