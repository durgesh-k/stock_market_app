import 'package:flutter/material.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';

class FeatureTileGrid extends StatelessWidget {
  const FeatureTileGrid(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.text,
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: icon,
              ),
            ),
            /*  child: Icon(
                  item['icon'],
                  size: 40,
                  color: Colors.blue,
                ), */
          ),
          Utils.addVerticalSpace(8),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.boldMediumLight(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
