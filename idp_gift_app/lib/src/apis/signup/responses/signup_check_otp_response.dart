import 'package:json_annotation/json_annotation.dart';

part 'signup_check_otp_response.g.dart';

@JsonSerializable()
class SignupCheckOTPResponse {
  SignupCheckOTPResponse();

  factory SignupCheckOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupCheckOTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupCheckOTPResponseToJson(this);

  @JsonKey(name: 'message')
  bool? data;
}

// @JsonSerializable()
// class DataSignupCheckOTPResponse {
//   DataSignupCheckOTPResponse();
//   factory DataSignupCheckOTPResponse.fromJson(Map<String, dynamic> json) => _$DataSignupCheckOTPResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$DataSignupCheckOTPResponseToJson(this);
//
//   @JsonKey(name: 'phone')
//   String? phone;
//
//   @JsonKey(name: 'sms_code')
//   String? smsCode;
// }
