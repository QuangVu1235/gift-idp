import 'package:json_annotation/json_annotation.dart';

part 'upload_file_responses.g.dart';

@JsonSerializable()
class UploadFileResponses {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'createTime')
  String? createTime;
  @JsonKey(name: 'updateTime')
  String? updateTime;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'folder')
  String? folder;
  @JsonKey(name: 'size')
  dynamic size;
  @JsonKey(name: 'mimeType')
  String? mimeType;

  UploadFileResponses();
  factory UploadFileResponses.fromJson(Map<String, dynamic> json) => _$UploadFileResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$UploadFileResponsesToJson(this);

}