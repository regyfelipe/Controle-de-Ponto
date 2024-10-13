import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[800]!
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blue, Colors.cyanAccent],
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2))
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    canvas.drawCircle(center, radius, backgroundPaint);

    final angle = 2 * pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, angle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
