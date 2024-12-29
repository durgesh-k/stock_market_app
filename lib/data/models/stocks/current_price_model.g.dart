// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPrice _$CurrentPriceFromJson(Map<String, dynamic> json) => CurrentPrice(
      bse: (json['bse'] as num?)?.toDouble(),
      nse: (json['nse'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentPriceToJson(CurrentPrice instance) =>
    <String, dynamic>{
      'bse': instance.bse,
      'nse': instance.nse,
    };
