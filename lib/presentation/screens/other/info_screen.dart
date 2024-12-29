import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';
import 'package:stock_market_app/presentation/widgets/buttons/button_small.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.info});
  final String info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(info,
                    textAlign: TextAlign.center,
                    style: TextStyles.boldMediumLight()),
                Utils.addVerticalSpace(30),
                ButtonSmall(
                    onPressed: () {
                      context.pop();
                    },
                    text: "Go Back")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
