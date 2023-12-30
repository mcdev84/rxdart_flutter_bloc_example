import 'package:flutter/material.dart';
import 'package:rx_dart/constants/theme/appbar_theme.dart';
import 'package:rx_dart/constants/theme/card_theme.dart';
import 'package:rx_dart/constants/theme/color/color_scheme.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/constants/theme/input_decoration_theme.dart';
import 'package:rx_dart/constants/theme/navigation_bar_theme.dart';
import 'package:rx_dart/constants/theme/search_appbar_theme.dart';
import 'package:rx_dart/constants/theme/text_theme.dart';

AnimatedTheme appAnimatedTheme(Widget child) =>
    AnimatedTheme(data: appTheme, child: child);

final ThemeData appTheme = ThemeData(
    fontFamily: 'TitilliumWeb',
    typography:
        Typography(white: textTheme, black: textTheme, dense: textTheme),
    appBarTheme: appBarTheme,
    cardTheme: cardTheme,
    colorScheme: colorScheme,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: lightGrey,
    searchBarTheme: searchAppBarTheme,
    textTheme: textTheme,
    useMaterial3: true,
    splashColor: Colors.transparent,
    navigationBarTheme: navigationBarThemeData);
