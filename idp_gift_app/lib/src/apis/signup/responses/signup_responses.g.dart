// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponses _$SignupResponsesFromJson(Map<String, dynamic> json) =>
    SignupResponses()
      ..userToken = json['token'] as String?
      ..userId = json['user_id'] as int?
      ..userType = json['user_type'] as String?;

Map<String, dynamic> _$SignupResponsesToJson(SignupResponses instance) =>
    <String, dynamic>{
      'token': instance.userToken,
      'user_id': instance.userId,
      'user_type': instance.userType,
    };
