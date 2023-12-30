import 'package:flutter/material.dart';

final double physicalHeight =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;

final double physicalWidth =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

final double devicePixelRatio =
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

final Size viewSize =
    Size(physicalWidth / devicePixelRatio, physicalHeight / devicePixelRatio);

final Size appBarSize = Size(viewSize.width, viewSize.height * .1);

final double appBarHeightExpanded = appBarSize.height * 1.5;

final Size searchBarSize = Size(viewSize.width * .75, appBarSize.height * .5);

final Size thumbSize = Size(viewSize.width * .4, viewSize.height * .15);

final expandedHeightAppBar = (appBarSize.height + appBarSize.height * .5);

final Size btnSize = Size(viewSize.width, viewSize.height * .05);

final Size bottomBarSize = Size(viewSize.width, viewSize.height * .1);
final Size bottomBarDividerSize = Size(viewSize.width, bottomBarSize.height * .1);

