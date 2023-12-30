import 'package:flutter/material.dart';

class AuthenticationClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    /// Calculate the height of the V-shaped arc (33% of the height)
    final height = size.height;
    final width = size.width;

    /// Draw a quadratic bezier curve to create the V-shaped arc
    path.cubicTo(-width * .45, height*1.325, width + width * .45, height*1.325, width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
