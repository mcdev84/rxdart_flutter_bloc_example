import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/text_style.dart';

final textTheme = TextTheme(
  titleSmall: textStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
  titleMedium: textStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
  titleLarge: textStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
  bodySmall: textStyle(fontSize: 14),
  bodyMedium: textStyle(fontSize: 16),
  bodyLarge: textStyle(fontSize: 18),
  labelSmall: textStyle(fontSize: 14, fontStyle: FontStyle.italic),
  labelMedium: textStyle(fontSize: 16, fontStyle: FontStyle.italic),
  labelLarge: textStyle(fontSize: 18, fontStyle: FontStyle.italic),
  displaySmall: textStyle(fontSize: 14),
  displayMedium: textStyle(fontSize: 16),
  displayLarge: textStyle(fontSize: 18),
);
