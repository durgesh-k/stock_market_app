import 'package:flutter/material.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: TextStyles.heading())),
    );
  }
}
