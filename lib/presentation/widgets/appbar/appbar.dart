import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/constants/system/system_overlay.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/user_icon.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key});

  static const name = 'ApplicationBar';
  static const titleAppBar = Text('Pizzario App', style: titleStyle);

  @override
  Widget build(BuildContext context) => SliverAppBar(
      systemOverlayStyle: systemUiOverlayStyle,
      flexibleSpace: Container(decoration: appBarGradient),
      automaticallyImplyLeading: false,
      toolbarHeight: appBarSize.height,
      key: const ValueKey(name),
      pinned: false,
      floating: true,
      actions: const [UserThumb()],
      snap: true,
      title: titleAppBar,
      centerTitle: true);

  @override
  Size get preferredSize => appBarSize;
}
