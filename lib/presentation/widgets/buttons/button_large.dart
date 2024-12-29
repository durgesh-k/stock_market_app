import 'package:flutter/material.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';

import '../loading_indicator.dart';

class ButtonLarge extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final bool enabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  const ButtonLarge(
      {super.key,
      required this.onPressed,
      required this.text,
      this.loading = false,
      this.enabled = true,
      this.backgroundColor,
      this.textColor,
      this.icon});

  @override
  State<ButtonLarge> createState() => _ButtonLargeState();
}

class _ButtonLargeState extends State<ButtonLarge> {
  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll((widget.enabled
                ? widget.backgroundColor ?? ColorName.primary
                : ColorName.primary)),
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15, horizontal: 30))),
        onPressed: () {
          if (widget.enabled) {
            widget.onPressed();
          }
        },
        child: SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.loading) const LoadingIndicator(color: Colors.black),
              if (!widget.loading && widget.icon != null) widget.icon!,
              if (widget.loading || widget.icon != null)
                const SizedBox(width: 10),
              if (!widget.loading)
                Text(
                  widget.text,
                  style: TextStyles.boldMedium().copyWith(
                      color: widget.textColor ??
                          (widget.enabled ? Colors.black : ColorName.text)),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ));
  }
}