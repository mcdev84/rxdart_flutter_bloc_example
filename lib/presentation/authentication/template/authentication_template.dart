import 'package:flutter/material.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

class AuthenticationPageTemplate extends StatelessWidget {
  final Widget form;
  final PreferredSizeWidget appBar;

  const AuthenticationPageTemplate(
      {required this.appBar, required this.form, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: lightGrey,
        body: CustomScrollView(slivers: [
          appBar,
          SliverPadding(
            sliver: form,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          )
        ]));
}
