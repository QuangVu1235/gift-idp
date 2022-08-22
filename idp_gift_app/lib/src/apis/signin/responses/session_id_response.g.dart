// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSessionIdResponse _$DataSessionIdResponseFromJson(
        Map<String, dynamic> json) =>
    DataSessionIdResponse(
      data: json['data'] == null
          ? null
          : SessionIdResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataSessionIdResponseToJson(
        DataSessionIdResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SessionIdResponse _$SessionIdResponseFromJson(Map<String, dynamic> json) =>
    SessionIdResponse(
      sessionId: json['session_id'] as String?,
    );

Map<String, dynamic> _$SessionIdResponseToJson(SessionIdResponse instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
    };
