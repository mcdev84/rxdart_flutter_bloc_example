import 'package:flutter/material.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

SnackBar snackAppBar({Widget? content}) => SnackBar(
    content: content ?? const Text('SNACK'),
    backgroundColor: happyBrown,
    dismissDirection: DismissDirection.down,
    duration: const Duration(milliseconds: 500),
    showCloseIcon: true,
    behavior: SnackBarBehavior.floating);
