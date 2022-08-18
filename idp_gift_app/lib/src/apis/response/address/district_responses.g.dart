// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictResponses _$DistrictResponsesFromJson(Map<String, dynamic> json) =>
    DistrictResponses()
      ..data = (json['data'] as List<dynamic>?)
          ?.map(
              (e) => DataDistrictResponses.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DistrictResponsesToJson(DistrictResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataDistrictResponses _$DataDistrictResponsesFromJson(
        Map<String, dynamic> json) =>
    DataDistrictResponses()
      ..id = json['id'] as int?
      ..code = json['code'] as String?
      ..name = json['name'] as String?
      ..cityCode = json['city_code'] as String?
      ..cityName = json['city_name'] as String?
      ..countryId = json['country_id'] as int?
      ..countryName = json['country_name'] as String?
      ..isActive = json['is_active'] as int?
      ..updatedAt = json['updated_at'] as String?;

Map<String, dynamic> _$DataDistrictResponsesToJson(
        DataDistrictResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'city_code': instance.cityCode,
      'city_name': instance.cityName,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'is_active': instance.isActive,
      'updated_at': instance.updatedAt,
    };
