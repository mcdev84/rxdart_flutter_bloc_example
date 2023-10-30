import 'package:flutter/material.dart';

final double physicalHeight =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;

final double physicalWidth =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

final double devicePixelRatio =
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

final double viewHeight = physicalHeight / devicePixelRatio;

final double viewWidth = physicalWidth / devicePixelRatio;

final double appBarHeight = viewHeight * .1;

final double appBarWidth = viewWidth * .9;

final double appBarHeightExpanded = appBarHeight * 1.5;

final double searchBarHeight = appBarHeight * .33;

final double searchBarWidth = viewWidth * .5;
