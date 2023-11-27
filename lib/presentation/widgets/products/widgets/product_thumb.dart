import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

class ProductThumb extends StatefulWidget {
  final ProductEntity product;

  const ProductThumb({required this.product, super.key});

  @override
  State<ProductThumb> createState() => _ProductThumbState();
}

class _ProductThumbState extends State<ProductThumb>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _heartbeatAnimation;

  @override
  void initState() {
    /// initializing AnimationController
    _animationController = AnimationController(
      vsync: this,
      /// duration is the period of time the animation would last
      duration: Duration(seconds: 20),
    );

    _heartbeatAnimation = Tween(begin: 180.0, end: 140.0).animate(
      CurvedAnimation(
        curve: Curves. easeOutQuart,
        parent: _animationController,
      ),
    );

    /// setting listener on animation and
    /// getting its status continuously everytime when its state changes
    _animationController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      },
    );

    /// forward starts the animation
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Image.network(widget.product.thumbnail!,
          filterQuality: FilterQuality.high,
          height: _heartbeatAnimation.value,
          //thumbSize.height,
          width: _heartbeatAnimation.value,
          //thumbSize.width,
          cacheHeight: thumbSize.height.toInt(),
          cacheWidth: (thumbSize.width * .4).toInt(),
          semanticLabel: widget.product.title));
}
