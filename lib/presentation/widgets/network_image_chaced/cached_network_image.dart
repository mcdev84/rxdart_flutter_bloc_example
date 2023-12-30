import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

ImageProvider<Object>? cachedNetworkImage({required String imageUrl}) =>
    ResizeImage(
        height: (250 * devicePixelRatio).round(),
        width: 250,
        Image.network(imageUrl,
                filterQuality: FilterQuality.high, fit: BoxFit.fitHeight)
            .image);
