import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SingleProductSlideTransition extends CustomTransitionPage<void> {
  SingleProductSlideTransition({super.key, required super.child})
      : super(
            transitionDuration: const Duration(milliseconds: 225),
            transitionsBuilder: (_, animation, __, child) => SlideTransition(
                position: animation.drive(Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.ease))),
                child: child));
}
