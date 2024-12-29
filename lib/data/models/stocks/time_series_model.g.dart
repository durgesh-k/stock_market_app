// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSeriesModel _$TimeSeriesModelFromJson(Map<String, dynamic> json) =>
    TimeSeriesModel(
      timeSeriesData: (json['Time Series (5min)'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, TimeSeriesData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$TimeSeriesModelToJson(TimeSeriesModel instance) =>
    <String, dynamic>{
      'timeSeriesData': instance.timeSeriesData,
    };

TimeSeriesData _$TimeSeriesDataFromJson(Map<String, dynamic> json) =>
    TimeSeriesData(
      open: json['1. open'] as String,
      high: json['2. high'] as String,
      low: json['3. low'] as String,
      close: json['4. close'] as String,
      volume: json['5. volume'] as String,
    );

Map<String, dynamic> _$TimeSeriesDataToJson(TimeSeriesData instance) =>
    <String, dynamic>{
      '1. open': instance.open,
      '2. high': instance.high,
      '3. low': instance.low,
      '4. close': instance.close,
      '5. volume': instance.volume,
    };
