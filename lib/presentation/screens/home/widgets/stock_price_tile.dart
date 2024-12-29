import 'package:flutter/material.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/data/models/chart/tile_data_model.dart';
import 'package:stock_market_app/gen/assets.gen.dart';
import 'package:stock_market_app/presentation/style/custom_decorations.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';

class StockPriceTile extends StatelessWidget {
  const StockPriceTile({super.key, required this.data});
  final TileData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomDecorations.customBorderedDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: data.isGrowing
                    ? Assets.icons.trendUp.svg(color: Colors.green, height: 40)
                    : Assets.icons.trendDown
                        .svg(color: Colors.red, height: 40)),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyles.boldSmallLight(),
                  ),
                  Utils.addVerticalSpace(4),
                  Text(
                    data.value ?? "-",
                    style: TextStyles.boldMediumLight().copyWith(
                        color: data.isGrowing ? Colors.green : Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
