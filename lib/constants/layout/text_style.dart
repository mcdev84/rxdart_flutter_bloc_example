import 'package:flutter/material.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

TextStyle textStyle(
        {required double fontSize,
        Color? color,
        FontWeight? fontWeight,
        FontStyle? fontStyle}) =>
    TextStyle(
        color: color ?? Colors.black,
        fontFamily: 'TitilliumWeb',
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal);

const titleStyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
const inputStyle =
    TextStyle(color: happyYellow, fontSize: 18, fontWeight: FontWeight.w500);
const hintStyle = TextStyle(
  color: middleGrey,
  fontSize: 14,
  fontStyle: FontStyle.italic,
);
const sigInWelcomeStyle =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
const btnTextStyle = TextStyle(
    color: happyYellow,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal);
const textFormStyle = TextStyle(
    color: darkGrey,

    decoration: TextDecoration.none,
    decorationThickness: 0,
    fontSize: 14);
const signUpStyle =
    TextStyle(color: happyYellow, fontSize: 16, fontWeight: FontWeight.w700);

const textFormLabelStyle =
    TextStyle(color: happyYellow, fontSize: 22, fontWeight: FontWeight.w500);

const errorTextStyle = TextStyle(
    color: gentlyRed,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1);
