import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

final searchAppBarTheme = SearchBarThemeData(
    backgroundColor:
        MaterialStateProperty.resolveWith((states) => happyYellow),
    elevation: MaterialStateProperty.resolveWith((states) => 6),
    textStyle:
        MaterialStateProperty.resolveWith((states) => searchBarInputStyle),
    hintStyle:
        MaterialStateProperty.resolveWith((states) => searchBarHintStyle));
