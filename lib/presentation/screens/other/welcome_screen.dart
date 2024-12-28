import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/core/utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(
          seconds:
              2)); // Delay added, can be replaced by any get initial data function
      // ignore: use_build_context_synchronously
      context.pushReplacementNamed(AppRoutes.home.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils.initializeSizeConfig(context);
    return const Scaffold(
      body: Center(
        child: Text("Stock Market App"),
      ),
    );
  }
}
