import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/data/enums/http_method.dart';
import 'package:stock_market_app/data/models/api/endpoint_model.dart';

abstract class Endpoints {
  static const _base = Constants.apiBase;
  /* static const _wssBase = Constants.apiBase;
  static final marketDataFeed = Endpoint(
      method: HttpMethod.get,
      base: _wssBase,
      segment: "/feed/market-data-feed"); */
  static final stockDataByName =
      Endpoint(method: HttpMethod.get, base: _base, segment: "stock");
}
