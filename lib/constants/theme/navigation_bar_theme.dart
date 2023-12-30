import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

final navigationBarThemeData = NavigationBarThemeData(
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    backgroundColor: darkPlusGrey,
    indicatorColor: happyYellow,
    labelTextStyle: MaterialStateProperty.resolveWith(
        (states) => const TextStyle(color: happyYellow, fontSize: 12)),
    height: bottomBarSize.height,
    iconTheme:
        MaterialStateProperty.resolveWith((states) => const IconThemeData(
              color: Colors.white,
              size: 20,
              opticalSize: 20,
            )));
