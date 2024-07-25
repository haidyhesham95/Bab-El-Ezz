import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  final List<List<Offset>> lines;
  final Paint drawPaint;
  final Paint markPaint;
  final ui.Image? backgroundImage;

  ImagePainter({
    required this.lines,
    required this.drawPaint,
    required this.markPaint,
    this.backgroundImage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (backgroundImage != null) {
      // Draw the background image
      paintImage(
        canvas: canvas,
        image: backgroundImage!,
        rect: Rect.fromLTWH(0, 0, size.width, size.height),
        fit: BoxFit.scaleDown,
      );
    }
    for (final line in lines) {
      if (line.isNotEmpty) {
        if (line.length == 1) {
          canvas.drawPoints(ui.PointMode.points, line, markPaint);
        } else {
          canvas.drawPoints(ui.PointMode.polygon, line, drawPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
