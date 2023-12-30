import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

const borderRadius3 = BorderRadius.all(Radius.circular(3));
const borderRadius8 = BorderRadius.all(Radius.circular(8));
const cardRoundedBorder8 = RoundedRectangleBorder(
    borderRadius: borderRadius8,
    side: BorderSide(color: happyYellow, width: 1.5));
const paddingAll8 = EdgeInsets.all(8);
const searchBarRoundedBorder3 =
    RoundedRectangleBorder(borderRadius: borderRadius3);
const searchBarHintStyle = TextStyle(color: Colors.grey, fontSize: 12);
const searchBarInputStyle = TextStyle(fontSize: 12);

const enabledTextFieldBorder =
    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1));
const focusedTextFieldBorder = OutlineInputBorder(
    borderSide:
        BorderSide(color: happyYellow, style: BorderStyle.solid, width: 1));

const emptyWidget = SizedBox.shrink();
const spacerH10 = SizedBox(height: 10);
const spacerH20 = SizedBox(height: 20);
const spacerH14 = SizedBox(height: 14);

Image logoWidget({double? height}) => Image(
    image: const AssetImage('assets/images/appattackLogo.png'),
    height: height ?? viewSize.height * .33,
    width: viewSize.width,
    filterQuality: FilterQuality.high);

const appBarGradient = BoxDecoration(
    gradient: LinearGradient(
        colors: [darkGrey, darkPlusGrey],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.33, 0.33]));
