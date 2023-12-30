import 'package:flutter/material.dart';
import 'package:rx_dart/presentation/widgets/appbar/appbar.dart';
import 'package:rx_dart/presentation/widgets/bottombar/navigation_bar_view.dart';
import 'package:rx_dart/presentation/widgets/hocs/hide_to_scoll.dart';

class PageTemplate extends StatefulWidget {
  final Widget child;
  final Widget? drawer;

  const PageTemplate({required this.child, this.drawer, super.key});

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(extendBody: true,
        key: GlobalKey<ScaffoldState>(),
        // drawer: const NavigationDrawer(children: [Text('DRAWER')]),
        body: CustomScrollView(
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: _controller,
            slivers: [/*const ApplicationBar(), */widget.child]),
        bottomNavigationBar: HideToScroll(
            controller: _controller, widget: const AppAttackBottomBar()),
      );
}
