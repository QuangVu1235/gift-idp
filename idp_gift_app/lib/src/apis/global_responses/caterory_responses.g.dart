// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caterory_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCaterroryResponses _$DataCaterroryResponsesFromJson(
        Map<String, dynamic> json) =>
    DataCaterroryResponses()
      ..data = (json['data'] as List<dynamic>?)
          ?.map(
              (e) => ItemCateroryResponses.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DataCaterroryResponsesToJson(
        DataCaterroryResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ItemCateroryResponses _$ItemCateroryResponsesFromJson(
        Map<String, dynamic> json) =>
    ItemCateroryResponses()
      ..id = json['id'] as int?
      ..isFeatured = json['is_featured']
      ..isHot = json['is_hot']
      ..code = json['code'] as String?
      ..name = json['name'] as String?
      ..image_url = json['image_url'];

Map<String, dynamic> _$ItemCateroryResponsesToJson(
        ItemCateroryResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_featured': instance.isFeatured,
      'is_hot': instance.isHot,
      'code': instance.code,
      'name': instance.name,
      'image_url': instance.image_url,
    };
