import 'package:flutter/material.dart';

class ApplicationBottomBar extends StatelessWidget {
  const ApplicationBottomBar({super.key});

  @override
  Widget build(BuildContext context) => BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: '1',
            icon: FloatingActionButton(
                mini: true,
                clipBehavior: Clip.hardEdge,
                onPressed: () {},
                child: const Icon(Icons.bolt))),
        const BottomNavigationBarItem(
            label: '2', icon: Icon(Icons.ac_unit), activeIcon: Icon(Icons.face))
      ]);
}
