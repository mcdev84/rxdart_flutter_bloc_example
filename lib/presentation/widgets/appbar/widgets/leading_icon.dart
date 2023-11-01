import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/presentation/home/view/home.dart';

class LeadingAppBarIcon extends StatelessWidget {
  const LeadingAppBarIcon({super.key});

  @override
  Widget build(BuildContext context) =>
      GoRouterState.of(context).path != HomePage.routeName
          ? IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back_ios))
        : IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu));
}
