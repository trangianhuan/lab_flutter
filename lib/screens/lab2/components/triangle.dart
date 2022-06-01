import 'package:flutter/material.dart';

class Triangle extends CustomPainter {
  final Color color;
  final double heightStart;
  final double width = double.infinity;
  Triangle({
    required this.color,
    this.heightStart = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;

    var path = Path();
    path.moveTo(0, heightStart);

    path.lineTo(0, size.height + heightStart);
    path.lineTo(size.width, size.height + heightStart);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
