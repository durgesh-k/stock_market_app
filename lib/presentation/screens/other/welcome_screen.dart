import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/widgets/buttons/button_large.dart';

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
      /* await Future.delayed(const Duration(
          seconds:
              2)); // Delay added, can be replaced by any get initial data function */
      // ignore: use_build_context_synchronously
      //context.pushReplacementNamed(AppRoutes.home.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils.initializeSizeConfig(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to the \nStock Market App",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorName.text, fontSize: 28),
                ),
                Utils.addVerticalSpace(10),
                const Text(
                  " By Acme Company Ltd",
                  style: TextStyle(color: ColorName.text),
                ),
                Utils.addVerticalSpace(50),
                ButtonLarge(
                    onPressed: () {
                      context.pushReplacementNamed(AppRoutes.home.name);
                    },
                    text: "Continue as Bob"),
                Utils.addVerticalSpace(10),
                ButtonLarge(
                    onPressed: () {
                      context.pushReplacementNamed(AppRoutes.home.name);
                    },
                    text: "Continue as Alice"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
