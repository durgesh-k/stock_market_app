import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/core/utils/calculations.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/data/models/chart/tile_data_model.dart';
import 'package:stock_market_app/data/models/stocks/stock_price_model.dart';
import 'package:stock_market_app/presentation/screens/home/home_bloc/home_bloc.dart';
import 'package:stock_market_app/presentation/screens/home/widgets/feature_tile.dart';
import 'package:stock_market_app/presentation/screens/home/views/market_update_view.dart';
import 'package:stock_market_app/presentation/screens/home/widgets/stock_price_graph.dart';
import 'package:stock_market_app/presentation/screens/home/widgets/stock_price_tile.dart';
import 'package:stock_market_app/presentation/widgets/heading_widget.dart';
import 'package:stock_market_app/presentation/widgets/snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc(stockName: "IBM");

  List<double> stockPrices = [];
  Map<String, StockPriceModel> otherStockPrices = {};

  @override
  void initState() {
    super.initState();
    _homeBloc.add(HomeDataInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listener: (context, state) {
        if (state is HomeGetData) {
          if (state.isSuccess) {
            setState(() {
              stockPrices = state.data.reversed.toList();
            });
          } else {
            showErrorSnackbar(
                context: context, message: "Unable to get stocks data");
          }
        } else if (state is StockUpdated) {
          if (state.isSuccess && state.model != null) {
            setState(() {
              otherStockPrices[state.stockName] = state.model!;
            });
          } else {
            showErrorSnackbar(
                context: context, message: "Unable to get stocks data");
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              _homeBloc.add(HomeRefreshDataEvent());
              await Future.delayed(const Duration(seconds: 2));
              return;
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      StockPriceGraph(
                        percentageChange:
                            Calculations.calculatePercentageChange(stockPrices),
                        stockPrices: stockPrices,
                        graphColor: Colors.green,
                        stockName: 'IBM',
                        priceChange:
                            Calculations.calculatePriceChange(stockPrices),
                      ),
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
          ),
        );
      },
    );
  }

  otherStocksPanel() => Row(
        children: List.generate(Constants.otherStocks.length, (index) {
          String stockSymbol = Constants.otherStocks[index];
          var stockPrice = otherStockPrices[stockSymbol];

          bool isGrowing = stockPrice != null ? stockPrice.change > 0 : false;
          String formattedPrice = stockPrice != null
              ? stockPrice.currentPrice.toStringAsFixed(2)
              : '-';

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: index > 0 ? 5.0 : 0.0,
                right: index < Constants.otherStocks.length - 1 ? 5.0 : 0.0,
              ),
              child: StockPriceTile(
                data: TileData(
                  title: stockSymbol,
                  value: formattedPrice,
                  isGrowing: isGrowing,
                ),
              ),
            ),
          );
        }),
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
