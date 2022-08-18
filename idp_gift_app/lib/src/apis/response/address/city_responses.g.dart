// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponses _$CityResponsesFromJson(Map<String, dynamic> json) =>
    CityResponses()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => DataCityResponses.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CityResponsesToJson(CityResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataCityResponses _$DataCityResponsesFromJson(Map<String, dynamic> json) =>
    DataCityResponses()
      ..id = json['id'] as int?
      ..code = json['code'] as String?
      ..name = json['name'] as String?
      ..fullname = json['full_name'] as String?
      ..description = json['description'] as String?
      ..countryId = json['country_id'] as int?
      ..countryName = json['country_name'] as String?
      ..isActive = json['is_active'] as int?
      ..updatedAt = json['updated_at'] as String?;

Map<String, dynamic> _$DataCityResponsesToJson(DataCityResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'full_name': instance.fullname,
      'description': instance.description,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'is_active': instance.isActive,
      'updated_at': instance.updatedAt,
    };
