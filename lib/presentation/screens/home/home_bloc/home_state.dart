part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetData extends HomeState {
  final bool isSuccess;
  final StockData data;

  HomeGetData({required this.isSuccess, required this.data});
}
