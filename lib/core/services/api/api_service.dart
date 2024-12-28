import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:stock_market_app/core/services/api/interceptors/auth_interceptor.dart';
import 'package:stock_market_app/core/services/api/interceptors/logger_interceptor.dart';
import 'package:stock_market_app/core/utils/secure_storage.dart';

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

  setOptions() async {
    String _key = await SecureStorage.getStringFromSF("token");
    Logger().f(_key);
    if (_key.isNotEmpty) {
      setKey(token: _key);
      Logger().f("Key Updated");
    } else {
      _dioClient.options = BaseOptions(headers: {"accept": "application/json"});
    }
  }

  setKey({required String token}) async {
    key = token;
    _dioClient.options = BaseOptions(headers: {
      "Authorization": "Bearer $key",
      "accept": "application/json"
    });
    Logger().f(_dioClient.options.headers);
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
