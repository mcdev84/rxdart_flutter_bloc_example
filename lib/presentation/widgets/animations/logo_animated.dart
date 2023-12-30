import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

class LogoAnimated extends StatefulWidget {
  final Size? logoSize;

  const LogoAnimated({this.logoSize, super.key});

  @override
  State<LogoAnimated> createState() => _LogoAnimatedState();
}

class _LogoAnimatedState extends State<LogoAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 750),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller, curve: Curves.fastEaseInToSlowEaseOut);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
      scale: _animation,
      filterQuality: FilterQuality.high,
      child: Center(
          child: Image(
              image: const AssetImage('assets/images/appattackLogo.png'),
              height: widget.logoSize?.height ?? viewSize.height * .33,
              width: widget.logoSize?.width ?? viewSize.width,
              filterQuality: FilterQuality.high)));
}
