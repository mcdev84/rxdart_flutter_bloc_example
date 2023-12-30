import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

class HideToScroll extends StatefulWidget {
  final ScrollController _controller;
  final Widget _widget;
  final Duration _duration;

  const HideToScroll(
      {required ScrollController controller,
      Duration duration = const Duration(milliseconds: 200),
      required Widget widget,
      super.key})
      : _duration = duration,
        _widget = widget,
        _controller = controller;

  @override
  State<HideToScroll> createState() => _HideToScrollState();
}

class _HideToScrollState extends State<HideToScroll> {
  bool _isVisible = true;

  void handleVisibility() => widget._controller.addListener(toggleVisibility);

  void toggleVisibility() => setState(() =>
      _isVisible = widget._controller.position.pixels >= 200 ? false : true);

  @override
  void initState() {
    handleVisibility();
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(toggleVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
      duration: widget._duration,
      height: _isVisible ? bottomBarSize.height : 0.0,
      child: widget._widget);
}
