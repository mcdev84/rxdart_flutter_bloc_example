import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

extension ImageExtension on num {
  int cacheSize(BuildContext context) {
    return (this * devicePixelRatio).round();
  }
}
