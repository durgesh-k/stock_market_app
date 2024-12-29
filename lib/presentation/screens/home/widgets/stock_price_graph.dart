import 'package:flutter/material.dart';
import 'package:stock_market_app/core/utils/size_config.dart';
import 'package:stock_market_app/data/models/chart/chart_data_model.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/custom_decorations.dart';
import 'package:stock_market_app/presentation/widgets/chart_painter.dart';

class StockPriceGraph extends StatelessWidget {
  const StockPriceGraph(
      {super.key, required this.data, required this.graphColor});
  final List<ChartData> data;
  final Color graphColor;

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

    //const stroke = 2.0;

    /* final List<DateTime> xValues =
        data.map((chartData) => chartData.x).toList();
    final List<double> yValues = data.map((chartData) => chartData.y).toList(); */

    return Container(
      width: SizeConfig.width,
      height: SizeConfig.height * 0.2,
      decoration: CustomDecorations.customBorderedDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: SizeConfig.width,
              height: SizeConfig.height * 0.2 - 45,
              child: CustomPaint(
                painter: CurvedChartPainter(
                  color: Colors.green,
                  yValues: yValues,
                  strokeWidth: 2,
                  xValues: xValues,
                  gradientColors: [graphColor, ColorName.background],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
