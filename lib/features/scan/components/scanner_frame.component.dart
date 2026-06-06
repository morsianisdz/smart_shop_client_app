import 'dart:ui';

import 'package:flutter/material.dart';

class ScannerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double radius = 20.0; // The rounded corner radius
    const double cornerLength = 30.0;
    
    // 1. Thin Grey Border
    final greyPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    
    // 2. Thick Orange Corner Paint
    final orangePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final RRect rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(radius),
    );

    // Draw the full grey rounded border
    canvas.drawRRect(rrect, greyPaint);

    // Draw orange corner segments
    // Top Left
    canvas.drawLine(Offset(0, cornerLength), Offset(0, radius), orangePaint);
    canvas.drawArc(Rect.fromLTWH(0, 0, radius * 2, radius * 2), 3.14, 1.57, false, orangePaint);
    canvas.drawLine(Offset(radius, 0), Offset(cornerLength, 0), orangePaint);

    // Top Right
    canvas.drawLine(Offset(size.width - cornerLength, 0), Offset(size.width - radius, 0), orangePaint);
    canvas.drawArc(Rect.fromLTWH(size.width - radius * 2, 0, radius * 2, radius * 2), 4.71, 1.57, false, orangePaint);
    canvas.drawLine(Offset(size.width, radius), Offset(size.width, cornerLength), orangePaint);

    // Bottom Left
    canvas.drawLine(Offset(0, size.height - cornerLength), Offset(0, size.height - radius), orangePaint);
    canvas.drawArc(Rect.fromLTWH(0, size.height - radius * 2, radius * 2, radius * 2), 1.57, 1.57, false, orangePaint);
    canvas.drawLine(Offset(radius, size.height), Offset(cornerLength, size.height), orangePaint);

    // Bottom Right
    canvas.drawLine(Offset(size.width - cornerLength, size.height), Offset(size.width - radius, size.height), orangePaint);
    canvas.drawArc(Rect.fromLTWH(size.width - radius * 2, size.height - radius * 2, radius * 2, radius * 2), 0, 1.57, false, orangePaint);
    canvas.drawLine(Offset(size.width, size.height - radius), Offset(size.width, size.height - cornerLength), orangePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}