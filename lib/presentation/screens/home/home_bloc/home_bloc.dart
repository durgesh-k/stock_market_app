import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:stock_market_app/core/respositories/stock_market_repository.dart';
import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/data/models/api/api_response_model.dart';
import 'package:stock_market_app/data/models/stocks/stock_price_model.dart';
import 'package:stock_market_app/data/models/stocks/time_series_model.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.stockName}) : super(HomeInitial()) {
    on<HomeDataInitEvent>(homeDataInitEvent);
    on<HomeRefreshDataEvent>(homeRefreshDataEvent);
  }

  String stockName;
  Timer? _stockUpdateTimer;

  Future<FutureOr<void>> homeDataInitEvent(
      HomeDataInitEvent event, Emitter<HomeState> emit) async {
    final completer = Completer<void>();
    await _updateStockData(emit);
    for (var s in Constants.otherStocks) {
      _stockUpdateTimer =
          Timer.periodic(const Duration(seconds: 5), (timer) async {
        _updateQuote(s, emit);
      });
    }
    await completer.future; // To avoid Bloc bad state error
  }

  _updateStockData(Emitter<HomeState> emit) async {
    ApiResponse response =
        await StockMarketRepository().getStockData(stockName);
    if (response.isSuccess) {
      TimeSeriesModel model = response.model;
      List<double> closeValues = model.timeSeriesData.values
          .map((data) => double.parse(data.close))
          .toList();
      emit(HomeGetData(data: closeValues, isSuccess: true));
    } else {
      emit(HomeGetData(data: [], isSuccess: false));
    }
  }

  _updateQuote(String stockName, Emitter<HomeState> emit) async {
    ApiResponse response = await StockMarketRepository().getQuote(stockName);
    if (response.isSuccess) {
      StockPriceModel model = response.model;
      emit(StockUpdated(isSuccess: true, model: model, stockName: stockName));
    } else {
      emit(StockUpdated(isSuccess: false, model: null, stockName: stockName));
    }
  }

  FutureOr<void> homeRefreshDataEvent(
      HomeRefreshDataEvent event, Emitter<HomeState> emit) {
    _updateStockData(emit);
    for (var s in Constants.otherStocks) {
      _updateQuote(s, emit);
    }
  }
}
