import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  const LoadingIndicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: 18,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
