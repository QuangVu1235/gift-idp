import 'package:json_annotation/json_annotation.dart';
part 'session_id_response.g.dart';

@JsonSerializable()
class DataSessionIdResponse{
  @JsonKey(name: 'data')
  SessionIdResponse? data;

  DataSessionIdResponse({this.data});

  factory DataSessionIdResponse.fromJson(Map<String, dynamic> json) => _$DataSessionIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataSessionIdResponseToJson(this);
}

@JsonSerializable()
class SessionIdResponse {

  @JsonKey(name: 'session_id')
  String? sessionId;

  SessionIdResponse({this.sessionId});

  factory SessionIdResponse.fromJson(Map<String, dynamic> json) => _$SessionIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SessionIdResponseToJson(this);

}