import 'package:flutter/material.dart';

class CustomButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width, -9)
      ..quadraticBezierTo(0, size.height / 2, size.width, size.height + 9);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TraingleButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width, -7)
      ..lineTo(10, size.height / 2 - 8)
      ..quadraticBezierTo(0, size.height / 2, 10, size.height / 2 + 8)
      ..lineTo(size.width, size.height + 7);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
