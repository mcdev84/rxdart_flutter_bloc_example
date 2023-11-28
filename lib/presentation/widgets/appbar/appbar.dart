import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/searchbar.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/user_icon.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key});

  static const name = 'ApplicationBar';

  @override
  Widget build(BuildContext context) => SliverAppBar(
      bottom: AppBar(toolbarHeight: 50,
        title: const SearchAppBar(),
        centerTitle: true,
      ),
      key: const ValueKey(name),
      pinned: true,
      floating: true,
      title: const Text('DummyJson shop'),
      actions: const [UserIcon()],
      snap: true,
      centerTitle: true);

  @override
  Size get preferredSize => appBarSize;
}
