import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_market_app/core/utils/size_config.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/gen/assets.gen.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/custom_decorations.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockPriceGraph extends StatelessWidget {
  const StockPriceGraph(
      {super.key,
      required this.stockPrices,
      required this.graphColor,
      required this.stockName,
      required this.percentageChange,
      required this.priceChange});
  final List<double> stockPrices;
  final Color graphColor;
  final String stockName;
  final double percentageChange;
  final double priceChange;

  @override
  Widget build(BuildContext context) {
    if (stockPrices.isEmpty) {
      return Container(
        width: SizeConfig.width,
        height: SizeConfig.height * 0.2,
        decoration: CustomDecorations.customBorderedDecoration(),
        child: Center(
          child: Text(
            "No data",
            style: TextStyles.regularLight()
                .copyWith(color: ColorName.primaryDark),
          ),
        ),
      );
    }
    bool isGrowing = percentageChange > 0 ? true : false;
    Color graphColor = isGrowing ? Colors.green : Colors.red;
    return Container(
      width: SizeConfig.width,
      height: SizeConfig.height * 0.2,
      decoration: CustomDecorations.customBorderedDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        stockName,
                        style: TextStyles.boldMediumLight(),
                      ),
                      Utils.addHorizontalSpace(16),
                      Text(
                        stockPrices.first.toString(),
                        style: TextStyles.regularMediumLight(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${priceChange.toStringAsFixed(2)} (${percentageChange.toStringAsFixed(2)} %)",
                        style: TextStyles.boldMediumLight()
                            .copyWith(color: graphColor),
                      ),
                      if (isGrowing)
                        Assets.icons.trendUp.svg(color: graphColor)
                      else
                        Assets.icons.trendDown.svg(color: graphColor)
                    ],
                  )
                ],
              ),
            ),
            /* const SizedBox(
              height: 10,
            ), */
            Expanded(
              /* width: SizeConfig.width,
              height: SizeConfig.height * 0.2 - 45, */
              child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  margin: EdgeInsets.zero,
                  zoomPanBehavior: ZoomPanBehavior(
                      enablePinching: true,
                      enableDoubleTapZooming: true,
                      enableSelectionZooming: true,
                      enablePanning: true),
                  primaryXAxis: NumericAxis(
                      zoomFactor: 0.6,
                      majorGridLines: const MajorGridLines(width: 0),
                      isVisible: false,
                      isInversed: false),
                  primaryYAxis: NumericAxis(
                      zoomFactor: 0.6,
                      zoomPosition: 0.25,
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(size: 0),
                      isVisible: false,
                      opposedPosition: false),
                  series: <LineSeries<double, int>>[
                    LineSeries<double, int>(
                        onRendererCreated:
                            (ChartSeriesController controller) {},
                        dataSource: stockPrices,
                        width: 1.4,
                        xValueMapper: (double val, _) => _,
                        yValueMapper: (double val, _) => val,
                        pointColorMapper: (double ecg, _) => graphColor,
                        animationDuration: 0,
                        markerSettings: const MarkerSettings(
                            isVisible: true, height: 3, width: 3)),
                  ]),
              /* CustomPaint(
                painter: CurvedChartPainter(
                  color: Colors.green,
                  yValues: yValues,
                  strokeWidth: 2,
                  xValues: xValues,
                  gradientColors: [graphColor, ColorName.background],
                ),
              ), */
            ),
          ],
        ),
      ),
    );
  }
}
