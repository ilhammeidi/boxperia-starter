import 'package:flutter/material.dart';

class OvalShape extends CustomPainter {
  final double width;
  final Color color;

  OvalShape({
    required this.width,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromLTWH(0, 0, width, 50); // Define the oval's bounding box
    canvas.drawOval(rect, paint); // Draw the oval
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
