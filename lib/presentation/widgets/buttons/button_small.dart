import 'package:flutter/material.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';

import '../loading_indicator.dart';

class ButtonSmall extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final bool enabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  const ButtonSmall(
      {super.key,
      required this.onPressed,
      required this.text,
      this.loading = false,
      this.enabled = true,
      this.backgroundColor,
      this.textColor,
      this.icon});

  @override
  State<ButtonSmall> createState() => _ButtonSmallState();
}

class _ButtonSmallState extends State<ButtonSmall> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
        ));
  }
}
