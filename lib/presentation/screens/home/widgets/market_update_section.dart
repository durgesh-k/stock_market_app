import 'package:flutter/material.dart';
import 'package:stock_market_app/gen/assets.gen.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';

class MarketUpdateSection extends StatelessWidget {
  const MarketUpdateSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Market features tiles
    final List<Map<String, dynamic>> items = List.generate(
      9,
      (index) => {
        'icon': marketUpdates[index]['icon'],
        'title': marketUpdates[index]['title'],
      },
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 columns
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular container with icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorName.text,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: item['icon'],
              ),
              /*  child: Icon(
                item['icon'],
                size: 40,
                color: Colors.blue,
              ), */
            ),
            const SizedBox(height: 8), // Space between circle and title
            // Title below the circular container
            Text(
              item['title'],
              overflow: TextOverflow.ellipsis,
              style: TextStyles.boldMediumLight(),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}

List<Map<String, dynamic>> marketUpdates = [
  {"icon": Assets.icons.marketUpdates.market.svg(), "title": "Market"},
  {"icon": Assets.icons.marketUpdates.investorStocks.svg(), "title": "Stocks"},
  {"icon": Assets.icons.marketUpdates.deals.svg(), "title": "Deals"},
  {"icon": Assets.icons.marketUpdates.commodity.svg(), "title": "Commodity"},
  {"icon": Assets.icons.marketUpdates.news.svg(), "title": "News"},
  {"icon": Assets.icons.marketUpdates.ipo.svg(), "title": "IPO"},
  {
    "icon": Assets.icons.marketUpdates.futures.svg(),
    "title": "Future & Options"
  },
  {"icon": Assets.icons.marketUpdates.industry.svg(), "title": "Industries"},
  {
    "icon": Assets.icons.marketUpdates.fllDll.svg(),
    "title": "Fll and Dll Activity"
  },
];
