import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/sign_in_clipper.dart';

class AppBarAuthentication extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? stepsIndicator;
  final String title;
  final String? subTitle1, subTitle2;
  final int? steps;

  const AppBarAuthentication(
      {required this.title,
      this.subTitle1,
      this.subTitle2,
      this.steps,
      this.stepsIndicator,
      super.key});

  @override
  Widget build(BuildContext context) => SliverAppBar(
        toolbarHeight: viewSize.height * .4,
        flexibleSpace: ClipPath(
            clipBehavior: Clip.antiAlias,
            clipper: AuthenticationClipper(),
            child: Container(
                decoration: appBarGradient,
                child: SafeArea(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.arrow_back_ios_rounded,
                                color: Colors.white, size: 18),
                            Text(title, style: titleStyle),
                            const Icon(Icons.menu,
                                color: Colors.white, size: 18)
                          ])),
                  Padding(
                      padding: EdgeInsets.only(top: appBarSize.height * .75),
                      child: Column(children: [
                        Visibility(
                            visible: subTitle1 != null,
                            replacement: emptyWidget,
                            child: Text(subTitle1!, style: sigInWelcomeStyle)),
                        Visibility(
                            visible: subTitle2 != null,
                            replacement: emptyWidget,
                            child: Text(subTitle2!, style: titleStyle)),
                        stepsIndicator != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: stepsIndicator!,
                              )
                            : emptyWidget
                      ]))
                ])))),
      );

  @override
  Size get preferredSize => Size(viewSize.width, viewSize.height * .4);
}
