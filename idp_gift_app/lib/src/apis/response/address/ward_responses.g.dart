// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WardResponses _$WardResponsesFromJson(Map<String, dynamic> json) =>
    WardResponses()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => DataWardResponses.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WardResponsesToJson(WardResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataWardResponses _$DataWardResponsesFromJson(Map<String, dynamic> json) =>
    DataWardResponses()
      ..id = json['id'] as int?
      ..code = json['code'] as String?
      ..name = json['name'] as String?
      ..districtCode = json['district_code'] as String?
      ..districtName = json['district_name'] as String?
      ..cityCode = json['city_code'] as String?
      ..cityName = json['city_name'] as String?
      ..countryId = json['country_id'] as int?
      ..countryName = json['country_name'] as String?
      ..isActive = json['is_active'] as int?
      ..updatedAt = json['updated_at'] as String?;

Map<String, dynamic> _$DataWardResponsesToJson(DataWardResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'district_code': instance.districtCode,
      'district_name': instance.districtName,
      'city_code': instance.cityCode,
      'city_name': instance.cityName,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'is_active': instance.isActive,
      'updated_at': instance.updatedAt,
    };
