import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/data/enums/http_method.dart';
import 'package:stock_market_app/data/models/api/endpoint_model.dart';

abstract class Endpoints {
  static const _base = Constants.alphaVantageApiBase;
  static const _finnhubBase = Constants.finnHubApiBase;
  /* static const _wssBase = Constants.apiBase;
  static final marketDataFeed = Endpoint(
      method: HttpMethod.get,
      base: _wssBase,
      segment: "/feed/market-data-feed"); */
  static final stockTimeSeries =
      Endpoint(method: HttpMethod.get, base: _base, segment: "query");
  static final quote =
      Endpoint(method: HttpMethod.get, base: _finnhubBase, segment: "quote");
}
