import 'package:json_annotation/json_annotation.dart';

part 'signin_responses.g.dart';

@JsonSerializable()
class SigninResponses {
  SigninResponses();
  factory SigninResponses.fromJson(Map<String, dynamic> json) => _$SigninResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$SigninResponsesToJson(this);

  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'user_type')
  String? userType;
  @JsonKey(name: 'role_id')
  int? roleId;
  @JsonKey(name: 'role_code')
  String? roleCode;
  @JsonKey(name: 'role_name')
  String? roleName;
  @JsonKey(name: 'account_status')
  String? accountStatus;
  @JsonKey(name: 'group_code')
  String? groupCode;
}