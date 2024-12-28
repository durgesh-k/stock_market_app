// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockData _$StockDataFromJson(Map<String, dynamic> json) => StockData(
      companyName: json['companyName'] as String,
      industry: json['industry'] as String?,
      companyProfile: CompanyProfile.fromJson(
          json['companyProfile'] as Map<String, dynamic>),
      currentPrice:
          CurrentPrice.fromJson(json['currentPrice'] as Map<String, dynamic>),
      percentChange: double.parse(json['percentChange']),
      yearHigh: (json['yearHigh'] == null ||
              (json['yearHigh'] is String && json['yearHigh'].trim().isEmpty))
          ? null
          : double.parse(json['yearHigh']),
      yearLow: (json['yearLow'] == null ||
              (json['yearLow'] is String && json['yearLow'].trim().isEmpty))
          ? null
          : double.parse(json['yearLow']),
    );

Map<String, dynamic> _$StockDataToJson(StockData instance) => <String, dynamic>{
      'companyName': instance.companyName,
      'industry': instance.industry,
      'companyProfile': instance.companyProfile,
      'currentPrice': instance.currentPrice,
      'percentChange': instance.percentChange,
      'yearHigh': instance.yearHigh,
      'yearLow': instance.yearLow,
    };
