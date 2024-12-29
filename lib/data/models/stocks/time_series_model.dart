import 'package:json_annotation/json_annotation.dart';

part 'time_series_model.g.dart';

// Main model class to hold the "Time Series (5min)"
@JsonSerializable()
class TimeSeriesModel {
  final Map<String, TimeSeriesData> timeSeriesData;

  TimeSeriesModel({required this.timeSeriesData});

  factory TimeSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSeriesModelToJson(this);
}

// Model class for each element inside the "Time Series (5min)" which represents a time period
@JsonSerializable()
class TimeSeriesData {
  @JsonKey(name: '1. open')
  final String open;

  @JsonKey(name: '2. high')
  final String high;

  @JsonKey(name: '3. low')
  final String low;

  @JsonKey(name: '4. close')
  final String close;

  @JsonKey(name: '5. volume')
  final String volume;

  TimeSeriesData({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory TimeSeriesData.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSeriesDataToJson(this);
}
