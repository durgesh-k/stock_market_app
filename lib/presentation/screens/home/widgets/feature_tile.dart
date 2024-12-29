import 'package:flutter/material.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';

class FeatureTile extends StatelessWidget {
  const FeatureTile(
      {super.key,
      required this.icon,
      required this.feature,
      required this.onTap});

  final IconData icon;
  final String feature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: ColorName.primary),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: ColorName.primary,
                  ),
                ),
              ),
              Utils.addVerticalSpace(10),
              Text(
                feature,
                style: TextStyles.boldMedium(),
              ),
              Utils.addVerticalSpace(4),
            ],
          ),
        ),
      ),
    );
  }
}
