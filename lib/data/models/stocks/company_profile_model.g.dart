// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyProfile _$CompanyProfileFromJson(Map<String, dynamic> json) =>
    CompanyProfile(
      companyDescription: json['companyDescription'] as String?,
      mgIndustry: json['mgIndustry'] as String?,
      isInId: json['isInId'] as String?,
      exchangeCodeBse: json['exchangeCodeBse'] as String?,
      exchangeCodeNse: json['exchangeCodeNse'] as String?,
    );

Map<String, dynamic> _$CompanyProfileToJson(CompanyProfile instance) =>
    <String, dynamic>{
      'companyDescription': instance.companyDescription,
      'mgIndustry': instance.mgIndustry,
      'isInId': instance.isInId,
      'exchangeCodeBse': instance.exchangeCodeBse,
      'exchangeCodeNse': instance.exchangeCodeNse,
    };
