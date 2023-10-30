import 'package:flutter/material.dart';
import 'package:rx_dart/presentation/widgets/appbar/appbar.dart';
import 'package:rx_dart/presentation/widgets/bottombar/bottombar.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;

  const PageTemplate({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      key: GlobalKey<ScaffoldState>(),
      drawer: const NavigationDrawer(children: [Text('DRAWER')]),
      bottomNavigationBar: const ApplicationBottomBar(),
      body: CustomScrollView(slivers: [const ApplicationBar(), child]));
}
