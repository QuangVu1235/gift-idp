// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileResponses _$UploadFileResponsesFromJson(Map<String, dynamic> json) =>
    UploadFileResponses()
      ..id = json['id'] as String?
      ..createTime = json['createTime'] as String?
      ..updateTime = json['updateTime'] as String?
      ..name = json['name'] as String?
      ..folder = json['folder'] as String?
      ..size = json['size']
      ..mimeType = json['mimeType'] as String?;

Map<String, dynamic> _$UploadFileResponsesToJson(
        UploadFileResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'name': instance.name,
      'folder': instance.folder,
      'size': instance.size,
      'mimeType': instance.mimeType,
    };
