import 'package:json_annotation/json_annotation.dart';
import 'package:stock_market_app/data/models/stocks/company_profile_model.dart';
import 'package:stock_market_app/data/models/stocks/current_price_model.dart';

part 'stock_data_model.g.dart';

@JsonSerializable()
class StockData {
  final String companyName;
  final String? industry;
  final CompanyProfile companyProfile;
  final CurrentPrice currentPrice;
  final double percentChange;
  final double? yearHigh;
  final double? yearLow;

  StockData({
    required this.companyName,
    required this.industry,
    required this.companyProfile,
    required this.currentPrice,
    required this.percentChange,
    required this.yearHigh,
    required this.yearLow,
  });

  factory StockData.fromJson(Map<String, dynamic> json) =>
      _$StockDataFromJson(json);
  Map<String, dynamic> toJson() => _$StockDataToJson(this);
}
