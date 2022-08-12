// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_user_phone_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListUserPhoneResponses _$ListUserPhoneResponsesFromJson(
        Map<String, dynamic> json) =>
    ListUserPhoneResponses(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataListUserPhoneResponses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListUserPhoneResponsesToJson(
        ListUserPhoneResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataListUserPhoneResponses _$DataListUserPhoneResponsesFromJson(
        Map<String, dynamic> json) =>
    DataListUserPhoneResponses(
      id: json['id'],
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      code: json['code'] as String?,
      groupCode: json['group_code'] as String?,
    );

Map<String, dynamic> _$DataListUserPhoneResponsesToJson(
        DataListUserPhoneResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'code': instance.code,
      'group_code': instance.groupCode,
    };
