import 'package:stock_market_app/data/models/api/async_response_model.dart';

class ApiResponse<T> {
  final T? model;
  final int statusCode;
  final String? message;
  final bool isSuccess;

  ApiResponse(
      {this.model,
      required this.statusCode,
      this.message,
      this.isSuccess = false});

  AsyncResponse toAsyncResponse({required String title}) =>
      AsyncResponse(title: title, body: message, isSuccess: isSuccess);
}
