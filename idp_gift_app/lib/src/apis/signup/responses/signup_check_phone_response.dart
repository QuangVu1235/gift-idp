import 'package:json_annotation/json_annotation.dart';

part 'signup_check_phone_response.g.dart';

@JsonSerializable()
class SignupCheckPhoneResponse {
  SignupCheckPhoneResponse();

  factory SignupCheckPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupCheckPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupCheckPhoneResponseToJson(this);

  @JsonKey(name: 'data')
  bool? data;
}
