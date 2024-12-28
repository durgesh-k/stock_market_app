// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPrice _$CurrentPriceFromJson(Map<String, dynamic> json) => CurrentPrice(
      bse: (json['BSE'] == null ||
              (json['BSE'] is String && json['BSE'].trim().isEmpty))
          ? null
          : double.parse(json["BSE"]),
      nse: (json['NSE'] == null ||
              (json['NSE'] is String && json['NSE'].trim().isEmpty))
          ? null
          : double.parse(json["NSE"]),
    );

Map<String, dynamic> _$CurrentPriceToJson(CurrentPrice instance) =>
    <String, dynamic>{
      'BSE': instance.bse,
      'NSE': instance.nse,
    };
