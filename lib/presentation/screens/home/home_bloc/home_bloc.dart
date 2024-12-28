import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_market_app/core/respositories/stock_market_repository.dart';
import 'package:stock_market_app/data/models/api/api_response_model.dart';
import 'package:stock_market_app/data/models/stocks/stock_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.stockName}) : super(HomeInitial()) {
    on<HomeDataInitEvent>(homeDataInitEvent);
  }

  String stockName;
  Timer? _stockUpdateTimer;

  Future<FutureOr<void>> homeDataInitEvent(
      HomeDataInitEvent event, Emitter<HomeState> emit) async {
    _stockUpdateTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
      _updateStockData();
    });
  }

  _updateStockData() async {
    ApiResponse response =
        await StockMarketRepository().getStockData(stockName);
    if (response.isSuccess) {
    } else {}
  }
}
