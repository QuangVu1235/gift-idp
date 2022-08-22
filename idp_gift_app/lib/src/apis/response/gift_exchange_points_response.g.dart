// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_exchange_points_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataGitExchangePoints _$DataGitExchangePointsFromJson(
        Map<String, dynamic> json) =>
    DataGitExchangePoints(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => GitExchangePointsResp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataGitExchangePointsToJson(
        DataGitExchangePoints instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GitExchangePointsResp _$GitExchangePointsRespFromJson(
        Map<String, dynamic> json) =>
    GitExchangePointsResp(
      id: json['id'] as int?,
      code: json['code'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      address: json['address'] as String?,
      fullName: json['full_name'] as String?,
      groupId: json['group_id'] as int?,
      groupName: json['group_name'] as String?,
      groupCode: json['group_code'] as String?,
      isActive: json['is_active'] as int?,
      tax: json['tax'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$GitExchangePointsRespToJson(
        GitExchangePointsResp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'phone': instance.phone,
      'email': instance.email,
      'type': instance.type,
      'address': instance.address,
      'full_name': instance.fullName,
      'group_id': instance.groupId,
      'group_name': instance.groupName,
      'group_code': instance.groupCode,
      'is_active': instance.isActive,
      'tax': instance.tax,
      'updated_at': instance.updatedAt,
    };
