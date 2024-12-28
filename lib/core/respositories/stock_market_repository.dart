import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:stock_market_app/core/services/api/api_service.dart';
import 'package:stock_market_app/core/services/api/endpoints/endpoints.dart';
import 'package:stock_market_app/data/models/api/api_response_model.dart';
import 'package:stock_market_app/data/models/api/endpoint_model.dart';
import 'package:stock_market_app/data/models/stocks/stock_data_model.dart';

class StockMarketRepository {
  Future<ApiResponse> getStockData(String stockName) async {
    Endpoint endpoint = Endpoints.stockDataByName;
    try {
      final response = await apiManager.request(
          url: endpoint.url,
          options: Options(method: endpoint.method.value),
          queryParameters: {"name": stockName});

      if (response.statusCode == 200 && response.data != null) {
        return ApiResponse<StockData>(
            statusCode: 200,
            model: StockData.fromJson(response.data),
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
}
