import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_market_app/core/services/api/interceptors/logger_interceptor.dart';

class APIManager {
  static final Dio _dioClient = Dio();
  String key = '';

  APIManager() {
    //_dioClient.interceptors.add(AuthInterceptor());
    _dioClient.interceptors.add(LoggerInterceptor());
    if (kDebugMode) {
      _dioClient.interceptors.add(LoggerInterceptor().prettyDioLogger);
    }
  }

  removeKey() async {
    _dioClient.options = BaseOptions(headers: {"accept": "application/json"});
  }

  Future<Response<T>> request<T>(
      {required String url,
      required Options options,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    _dioClient.options = BaseOptions(headers: {
      "accept": "application/json",
      "responseType": "application/json"
    });
    return await _dioClient.request(url,
        options: options,
        queryParameters: queryParameters ?? {},
        data: data ?? {});
  }

  /* Future<http.Response> get(
      {required String url, Map<String, String>? headers}) async {
    return await http.get(
      Uri.parse(url),
      headers: headers ?? {"accept": "application/json"},
    );
  } */
}

APIManager apiManager = APIManager();
