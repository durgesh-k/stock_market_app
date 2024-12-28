import 'package:flutter/material.dart';
import 'package:stock_market_app/core/utils/size_config.dart';
import 'package:stock_market_app/presentation/widgets/chart_painter.dart';

class MyCurvedChart extends StatelessWidget {
  const MyCurvedChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, double>> xValues = [
      {"day 1": 80.0},
      {"day 2": 50.0},
      {"day 3": 30.0},
      {"day 4": 50.0},
      {"day 5": 10.0},
      {"day 6": 0.0},
      {"day 7": 100.0},
    ];

    final List<Map<String, double>> yValues = [
      {"0": 0.0},
      {"20": 20.0},
      {"40": 40.0},
      {"60": 60.0},
      {"80": 80.0},
      {"100": 100.0},
    ];

    const stroke = 2.0;

    return SizedBox(
      width: SizeConfig.width * 0.8,
      height: SizeConfig.height * 0.6,
      child: CustomPaint(
        painter: CurvedChartPainter(
          color: Colors.green,
          yValues: yValues,
          strokeWidth: stroke,
          xValues: xValues,
          gradientColors: [
            Colors.green.withAlpha(100),
            const Color(0xFFFFFFFF),
          ],
        ),
      ),
    );
  }
}
