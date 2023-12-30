import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class StandardTransition extends CustomTransitionPage<void> {
  StandardTransition({super.key, required super.child})
      : super(
      transitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
            position: animation.drive(Tween(
              begin: const Offset(0.75, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease))),
            child: child);
      });
}