part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetData extends HomeState {
  final bool isSuccess;
  final List<double> data;

  HomeGetData({required this.isSuccess, required this.data});
}

final class StockUpdated extends HomeState {
  final StockPriceModel? model;
  final String stockName;
  final bool isSuccess;

  StockUpdated(
      {required this.model, required this.stockName, required this.isSuccess});
}
