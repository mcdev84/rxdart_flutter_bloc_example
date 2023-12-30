import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

class NavBarSelectedIcon extends StatelessWidget {
  final Widget icon;

  const NavBarSelectedIcon({required this.icon, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 20 + bottomBarDividerSize.height,
      width: 20,
      child: Column(children: [
        Divider(color: happyYellow, height: bottomBarDividerSize.height),
        icon
      ]));
}
