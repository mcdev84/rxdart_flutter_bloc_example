import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

ImageProvider<Object>? cachedNetworkImage(
        {required String imageUrl, int? cachedHeight, int? cachedWidth}) =>
    ResizeImage(
        height: cachedHeight ?? (250 * devicePixelRatio).round(),
        width: cachedWidth ?? (250 * devicePixelRatio).round(),
        Image.network(imageUrl, filterQuality: FilterQuality.high).image);
