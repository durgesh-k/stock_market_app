import 'package:flutter/material.dart';
import 'package:stock_market_app/core/services/router/app_router.dart';
import 'package:stock_market_app/core/utils/env_util.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/presentation/style/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  env.getApp();
  runApp(const MyStockMarketApp());
}

class MyStockMarketApp extends StatelessWidget {
  const MyStockMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.unfocusOnFocusChanged(context),
      child: MaterialApp.router(
          title: 'Stock Market App',
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          scaffoldMessengerKey: Utils.navigatorKey,
          routerConfig: AppRouter.goRouter),
    );
  }
}
