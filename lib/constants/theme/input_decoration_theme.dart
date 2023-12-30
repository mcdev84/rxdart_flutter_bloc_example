import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/layout/text_style.dart';

const inputDecorationTheme = InputDecorationTheme(
    fillColor: Colors.white,errorStyle: errorTextStyle,
    filled: true,
    labelStyle: textFormLabelStyle,
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: enabledTextFieldBorder,
    focusedBorder: focusedTextFieldBorder,
    floatingLabelAlignment: FloatingLabelAlignment.center,
    hintStyle: hintStyle);
