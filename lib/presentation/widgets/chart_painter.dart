import 'package:flutter/material.dart';

// CustomPainter class to draw a curved chart
class CurvedChartPainter extends CustomPainter {
  final List<Map<String, double>> xValues;
  final List<Map<String, double>> yValues;
  final Color? color;
  final double strokeWidth;
  final List<Color> gradientColors;
  final List<double> gradientStops;
  final TextStyle labelTextStyle;

  CurvedChartPainter({
    required this.xValues,
    required this.yValues,
    required this.strokeWidth,
    this.color,
    this.gradientColors = const [
      Color(0x00F63E02),
      Color(0xFFFFFFFF),
    ],
    this.gradientStops = const [0.0, 1.0],
    this.labelTextStyle = const TextStyle(color: Colors.grey, fontSize: 12),
  });
  @override
  void paint(Canvas canvas, Size size) {
    // Set up the paint for the chart line
    var paint = Paint();
    paint.color = color ?? const Color(0xFFF63E02);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    // Set up the paint for the chart fill
    var fillPaint = Paint();
    fillPaint.style = PaintingStyle.fill;

    // Create paths for the chart line and fill
    var path = Path();
    var fillPath = Path();

    // Check if there are enough values to draw the chart
    if (xValues.length > 1 && yValues.isNotEmpty) {
      // Calculate some initial values
      final maxValue = yValues.last.values.last;
      final firstValueHeight =
          size.height * (xValues.first.values.first / maxValue);

      // Initialize the paths with the first point
      path.moveTo(0.0, size.height - firstValueHeight);
      fillPath.moveTo(0.0, size.height);
      fillPath.lineTo(0.0, size.height - firstValueHeight);

      // Calculate the distance between each x value
      final itemXDistance = size.width / (xValues.length - 1);

      // Loop through the x values and draw the chart line and fill
      for (var i = 1; i < xValues.length; i++) {
        final x = itemXDistance * i;
        final valueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) *
                (xValues[i].values.elementAt(0) / maxValue));
        final previousValueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) *
                (xValues[i - 1].values.elementAt(0) / maxValue));

        // Directly connect the points with straight lines (no curves)
        path.lineTo(x, valueHeight);

        // Draw the fill path using straight lines
        fillPath.lineTo(x, valueHeight);
      }

      // Close the fill path
      fillPath.lineTo(size.width, size.height);
      fillPath.close();
    }

    // Create a gradient for the fill
    LinearGradient gradient = LinearGradient(
      colors: gradientColors,
      stops: gradientStops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    fillPaint.shader = gradient.createShader(rect);

    // Draw the fill path with the gradient
    canvas.drawPath(fillPath, fillPaint);

    // Draw the chart line
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
