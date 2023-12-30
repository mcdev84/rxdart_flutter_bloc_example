import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

class AppAttackButton extends StatelessWidget {
  final Function()? onPressed;
  final String btnText;

  const AppAttackButton(
      {  this.onPressed, required this.btnText, super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          fixedSize: MaterialStateProperty.all(btnSize),
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => darkPlusGrey)),
      child: Text(btnText, style: btnTextStyle));
}
