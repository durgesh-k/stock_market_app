import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:stock_market_app/core/utils/env_util.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      String token = env.token;

      if (token.isNotEmpty) {
        options.headers['x-rapidapi-key'] = token;
      }

      handler.next(options);
    } catch (e) {
      Logger().e(e);
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          error: 'Error retrieving token: $e',
        ),
      );
    }
  }
}
