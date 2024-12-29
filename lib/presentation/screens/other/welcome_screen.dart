import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/core/utils/secure_storage.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';
import 'package:stock_market_app/presentation/widgets/buttons/button_large.dart';
import 'package:stock_market_app/presentation/widgets/snackbar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                Text(
                  "Welcome to the \nStock Market App",
                  textAlign: TextAlign.center,
                  style: TextStyles.headingLargeLight(),
                ),
                Utils.addVerticalSpace(10),
                Text(
                  "By Acme Company Ltd",
                  style: TextStyles.regularLight(),
                ),
                Utils.addVerticalSpace(50),
                ButtonLarge(
                    onPressed: () {
                      redirectToHome(context, "Bob");
                    },
                    text: "Continue as Bob"),
                Utils.addVerticalSpace(10),
                ButtonLarge(
                    onPressed: () {
                      redirectToHome(context, "Alice");
                    },
                    text: "Continue as Alice"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  redirectToHome(BuildContext context, String userName) {
    SecureStorage.addStringToSF(ValueKeys.user, userName);
    context.pushReplacementNamed(AppRoutes.home.name);
    showInfoSnackBar(context: context, message: "Logged in as $userName");
  }
}
