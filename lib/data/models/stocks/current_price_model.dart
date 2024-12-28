import 'package:json_annotation/json_annotation.dart';

part 'current_price_model.g.dart';

@JsonSerializable()
class CurrentPrice {
  final double? bse;
  final double? nse;

  CurrentPrice({
    required this.bse,
    required this.nse,
  });
  factory CurrentPrice.fromJson(Map<String, dynamic> json) =>
      _$CurrentPriceFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentPriceToJson(this);
}
