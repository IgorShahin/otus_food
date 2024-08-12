import 'dart:ui';
import 'package:flutter/painting.dart';

class DashedRoundedRectangleBorder extends RoundedRectangleBorder {
  const DashedRoundedRectangleBorder({
    required super.side,
    required super.borderRadius,
  });

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = side.toPaint();
    paint.style = PaintingStyle.stroke;

    final BorderRadius borderRadius = this.borderRadius.resolve(textDirection);
    final RRect rrect = borderRadius.toRRect(rect);

    final Path path = Path();
    path.addRRect(rrect);

    final Path dashedPath = _createDashedPath(path);
    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path source) {
    const double dashLength = 18.0;
    const double dashSpacing = 15.0;

    final Path dashedPath = Path();
    final PathMetrics pathMetrics = source.computeMetrics();

    for (final PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double length = distance + dashLength;
        final Path extract = pathMetric.extractPath(distance, length);
        dashedPath.addPath(extract, Offset.zero);
        distance = length + dashSpacing;
      }
    }
    return dashedPath;
  }
}