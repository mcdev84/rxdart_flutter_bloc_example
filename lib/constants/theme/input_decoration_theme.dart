import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/styles.dart';

const inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    floatingLabelAlignment: FloatingLabelAlignment.center,
    hintStyle: searchBarHintStyle);
