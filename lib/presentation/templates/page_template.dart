import 'package:flutter/material.dart';
import 'package:rx_dart/presentation/widgets/appbar/appbar.dart';
import 'package:rx_dart/presentation/widgets/bottombar/bottombar.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final Widget? drawer;

  const PageTemplate({required this.child,this.drawer, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
     // / extendBodyBehindAppBar: true,
      key: GlobalKey<ScaffoldState>(),
     // drawer: const NavigationDrawer(children: [Text('DRAWER')]),
      bottomNavigationBar: const ApplicationBottomBar(),
      body: SafeArea(
        child: CustomScrollView(slivers: [const ApplicationBar(), child]),
      ));
}
