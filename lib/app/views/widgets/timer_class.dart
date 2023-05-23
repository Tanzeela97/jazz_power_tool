import 'dart:math';
import 'package:flutter/material.dart';

import '../../data/constant/app_color.dart';

class CountdownPainter extends CustomPainter {
  final Duration duration;
  final Duration elapsed;

  CountdownPainter({required this.duration, required this.elapsed});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 18;
    final double anglePerSec = 2 * pi / duration.inMinutes;

    // Draw elapsed time
    final elapsedSecs = elapsed.inMinutes;
    for (int i = 0; i < duration.inMinutes; i++) {
      final paint = Paint()
        ..strokeWidth = strokeWidth
        ..color = i < elapsedSecs ? AppColor.red : AppColor.fontColorButton
        ..style = PaintingStyle.stroke;

      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2 - strokeWidth / 2),
        -pi / 2 + anglePerSec * i,
        anglePerSec - 0.03,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
