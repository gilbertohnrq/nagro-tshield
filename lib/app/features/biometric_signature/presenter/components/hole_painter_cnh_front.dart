// coverage:ignore-file
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:flutter/material.dart';

class HolePainterCnhFront extends CustomPainter {
  final BuildContext context;

  HolePainterCnhFront({super.repaint, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black.withValues(alpha: 0.4);
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromLTRBR(0, 0, MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height, const Radius.circular(0))),
        Path()
          ..addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(
                MediaQuery.of(context).size.width * 0.08,
                (MediaQuery.of(context).size.height + ThemeSizes.h60) / 2 -
                    ((MediaQuery.of(context).size.width * 0.84) * 1.38 / 1.8),
                MediaQuery.of(context).size.width * 0.84,
                (MediaQuery.of(context).size.width * 0.84) * 1.38),
            const Radius.circular(12),
          )),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
