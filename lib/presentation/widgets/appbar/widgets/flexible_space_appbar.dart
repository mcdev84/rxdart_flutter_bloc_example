import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

class FlexibleSpaceAppBar extends StatelessWidget {
  const FlexibleSpaceAppBar({super.key});

  @override
  Widget build(BuildContext context) => FlexibleSpaceBar.createSettings(
      minExtent: appBarSize.height,
      maxExtent: appBarSize.height + 50,
      currentExtent: appBarSize.height,
      toolbarOpacity: 1,
      child: const SizedBox());
}
