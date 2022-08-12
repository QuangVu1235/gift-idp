// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninResponses _$SigninResponsesFromJson(Map<String, dynamic> json) =>
    SigninResponses()
      ..token = json['token'] as String?
      ..userId = json['user_id'] as int?
      ..userType = json['user_type'] as String?
      ..roleId = json['role_id'] as int?
      ..roleCode = json['role_code'] as String?
      ..roleName = json['role_name'] as String?
      ..accountStatus = json['account_status'] as String?
      ..groupCode = json['group_code'] as String?;

Map<String, dynamic> _$SigninResponsesToJson(SigninResponses instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'role_id': instance.roleId,
      'role_code': instance.roleCode,
      'role_name': instance.roleName,
      'account_status': instance.accountStatus,
      'group_code': instance.groupCode,
    };
