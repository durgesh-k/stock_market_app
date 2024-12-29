import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:stock_market_app/core/services/api/api_service.dart';
import 'package:stock_market_app/core/services/api/endpoints/endpoints.dart';
import 'package:stock_market_app/core/utils/secure_storage.dart';
import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/data/models/api/api_response_model.dart';
import 'package:stock_market_app/data/models/api/endpoint_model.dart';
import 'package:stock_market_app/data/models/stocks/stock_price_model.dart';
import 'package:stock_market_app/data/models/stocks/time_series_model.dart';

class StockMarketRepository {
  Future<ApiResponse> getStockData(String stockName) async {
    Endpoint endpoint = Endpoints.stockTimeSeries;
    try {
      //String token = await SecureStorage.getStringFromSF(ValueKeys.tokenKey);
      final response = await apiManager.request(
          url: endpoint.url,
          options: Options(method: endpoint.method.value),
          queryParameters: {
            "function": "TIME_SERIES_INTRADAY",
            "symbol": stockName,
            "interval": "5min",
            "apikey": "demo"
          });

      if (response.statusCode == 200 && response.data != null) {
        return ApiResponse<TimeSeriesModel>(
            statusCode: 200,
            model: TimeSeriesModel.fromJson(response.data),
            message: "Stocks fetch successful",
            isSuccess: true);
      } else {
        String message = response.data.toString();
        return ApiResponse(
            statusCode: response.statusCode ?? 500, message: message);
      }
    } on DioException catch (e) {
      Logger().e(e);
      String message = /*  e.response?.data['message'] ?? */
          "Something went wrong. Please try again";
      return ApiResponse(
          statusCode: e.response?.statusCode ?? 500, message: message);
    }
  }

  Future<ApiResponse> getQuote(String stockName) async {
    Endpoint endpoint = Endpoints.quote;
    try {
      String token = await SecureStorage.getStringFromSF(ValueKeys.tokenKey);
      final response = await apiManager.request(
          url: endpoint.url,
          options: Options(method: endpoint.method.value),
          queryParameters: {"symbol": stockName, "token": token});

      if (response.statusCode == 200 && response.data != null) {
        return ApiResponse<StockPriceModel>(
            statusCode: 200,
            model: StockPriceModel.fromJson(response.data, stockName),
            message: "Stock quote fetch successful",
            isSuccess: true);
      } else {
        String message = response.data.toString();
        return ApiResponse(
            statusCode: response.statusCode ?? 500, message: message);
      }
    } on DioException catch (e) {
      Logger().e(e);
      String message = /*  e.response?.data['message'] ?? */
          "Something went wrong. Please try again";
      return ApiResponse(
          statusCode: e.response?.statusCode ?? 500, message: message);
    }
  }
}
