import 'package:json_annotation/json_annotation.dart';

part 'company_profile_model.g.dart';

@JsonSerializable()
class CompanyProfile {
  final String? companyDescription;
  final String? mgIndustry;
  final String? isInId;
  final String? exchangeCodeBse;
  final String? exchangeCodeNse;

  CompanyProfile({
    required this.companyDescription,
    required this.mgIndustry,
    required this.isInId,
    required this.exchangeCodeBse,
    required this.exchangeCodeNse,
  });

  factory CompanyProfile.fromJson(Map<String, dynamic> json) =>
      _$CompanyProfileFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyProfileToJson(this);
}
