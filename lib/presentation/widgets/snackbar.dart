import 'package:flutter/material.dart';

showErrorSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.red, content: Text(message)),
  );
}

showInfoSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

showSuccessSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.green, content: Text(message)),
  );
}
