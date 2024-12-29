import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_market_app/core/services/api/interceptors/auth_interceptor.dart';
import 'package:stock_market_app/core/services/api/interceptors/logger_interceptor.dart';

class APIManager {
  static final Dio _dioClient = Dio();
  String key = '';

  APIManager() {
    _dioClient.interceptors.add(AuthInterceptor());
    _dioClient.interceptors.add(LoggerInterceptor());
    if (kDebugMode) {
      _dioClient.interceptors.add(LoggerInterceptor().prettyDioLogger);
    }
    //setOptions();
  }

  removeKey() async {
    _dioClient.options = BaseOptions(headers: {"accept": "application/json"});
  }

  Future<Response<T>> request<T>(
      {required String url,
      required Options options,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    return await _dioClient.request(url,
        options: options,
        queryParameters: queryParameters ?? {},
        data: data ?? {});
  }
}

APIManager apiManager = APIManager();
