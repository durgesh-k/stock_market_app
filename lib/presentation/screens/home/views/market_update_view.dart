import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/gen/assets.gen.dart';
import 'package:stock_market_app/presentation/screens/home/widgets/feature_tile_grid.dart';

class MarketUpdateView extends StatelessWidget {
  const MarketUpdateView({super.key});

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
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return FeatureTileGrid(
            title: item['title'],
            icon: item['icon'],
            onTap: () {
              context.pushNamed(AppRoutes.info.name,
                  extra: "This feature is coming soon..");
            });
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
