import 'package:json_annotation/json_annotation.dart';

part 'forget_password_cofirm_otp_responses.g.dart';

@JsonSerializable()
class ForgetPasswordConfirmOtpResponses {
  ForgetPasswordConfirmOtpResponses();

  factory ForgetPasswordConfirmOtpResponses.fromJson(Map<String, dynamic> json)
  => _$ForgetPasswordConfirmOtpResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordConfirmOtpResponsesToJson(this);


  @JsonKey(name: 'message')
  bool? isSuccess;

}