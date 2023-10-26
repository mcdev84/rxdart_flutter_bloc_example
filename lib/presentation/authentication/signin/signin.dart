import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
       slivers: [  SliverAppBar(
         expandedHeight: 200,
         flexibleSpace: FlexibleSpaceBar(background: Container(color: Colors.red,)),
         primary: true,
         leading: IconButton(
             onPressed: () => Scaffold.of(context).openDrawer(),
             icon: const Icon(Icons.menu_sharp)),
         title: const Text('DUMMY JSON'),
         centerTitle: true,
         actions: [],
       )],
    );
  }
}
