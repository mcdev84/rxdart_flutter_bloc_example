import 'package:flutter/material.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

const borderRadius3 = BorderRadius.all(Radius.circular(3));
const borderRadius8 = BorderRadius.all(Radius.circular(8));
const cardRoundedBorder8 = RoundedRectangleBorder(
    borderRadius: borderRadius8,
    side: BorderSide(color: happyBrown, width: 1.5));
const paddingAll8 = EdgeInsets.all(8);
const searchBarRoundedBorder3 =
    RoundedRectangleBorder(borderRadius: borderRadius3);
const searchBarHintStyle = TextStyle(color: Colors.grey, fontSize: 12);
const searchBarInputStyle = TextStyle(fontSize: 12);