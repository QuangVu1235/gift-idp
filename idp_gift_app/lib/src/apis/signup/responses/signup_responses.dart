import 'package:json_annotation/json_annotation.dart';

part 'signup_responses.g.dart';

@JsonSerializable()
class SignupResponses {
  SignupResponses();

  factory SignupResponses.fromJson(Map<String, dynamic> json) =>
      _$SignupResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponsesToJson(this);

  @JsonKey(name: 'token')
  String? userToken;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'user_type')
  String? userType;
}
