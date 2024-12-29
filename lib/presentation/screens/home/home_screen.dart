import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/data/models/chart/tile_data_model.dart';
import 'package:stock_market_app/presentation/screens/home/home_bloc/home_bloc.dart';
import 'package:stock_market_app/presentation/screens/home/widgets/feature_tile.dart';
import 'package:stock_market_app/presentation/screens/home/views/market_update_view.dart';
import 'package:stock_market_app/presentation/screens/home/widgets/stock_price_graph.dart';
import 'package:stock_market_app/presentation/screens/home/widgets/stock_price_tile.dart';
import 'package:stock_market_app/presentation/widgets/heading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc(stockName: "Nifty 50");

  @override
  void initState() {
    super.initState();
    //_homeBloc.add(HomeDataInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const StockPriceGraph(data: [], graphColor: Colors.green),
                Utils.addVerticalSpace(10),
                otherStocksPanel(),
                Utils.addVerticalSpace(10),
                featurePanel(),
                const HeadingWidget(title: "Market Updates"),
                const MarketUpdateView()
              ],
            ),
          ),
        ),
      ),
    );
  }

  otherStocksPanel() => Row(
        children: [
          Expanded(
              child: StockPriceTile(
                  data: TileData(
                      title: "Nifty 50", value: "230", isGrowing: false))),
          Utils.addHorizontalSpace(10),
          Expanded(
              child: StockPriceTile(
                  data: TileData(
                      title: "Nifty 50", value: "230", isGrowing: false))),
          Utils.addHorizontalSpace(10),
          Expanded(
              child: StockPriceTile(
                  data: TileData(
                      title: "Nifty 50", value: "230", isGrowing: false)))
        ],
      );

  featurePanel() => Row(
        children: [
          Expanded(
              child: FeatureTile(
                  icon: Icons.video_call_outlined,
                  feature: "Video Call",
                  onTap: () {
                    context.pushNamed(AppRoutes.info.name,
                        extra: "Video Call feature coming soon..");
                  })),
          Utils.addHorizontalSpace(10),
          Expanded(
              child: FeatureTile(
                  icon: Icons.call,
                  feature: "Audio Call",
                  onTap: () {
                    context.pushNamed(AppRoutes.payment.name);
                  })),
          Utils.addHorizontalSpace(10),
          Expanded(
              child: FeatureTile(
                  icon: Icons.chat_outlined,
                  feature: "Chat",
                  onTap: () {
                    context.pushNamed(AppRoutes.info.name,
                        extra: "Chat feature coming soon..");
                  })),
        ],
      );
}
