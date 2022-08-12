import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/global_responses/message_responses.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_check_otp_response.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_check_phone_response.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_responses.dart';
import 'package:idp_gift_app/src/apis/signup/signup_datasource.dart';

@LazySingleton()
class SignupUsecase {
  final SignupDatasource _signupDatasource;

  @factoryMethod
  SignupUsecase(this._signupDatasource);

  Future<MessageResponses> sendOTP(String phone) =>
      _signupDatasource.sendOTP(phone);

  Future<SignupCheckOTPResponse> checkOTP(String phone, String otp) =>
      _signupDatasource.checkOTP(phone, otp);

  Future<SignupCheckPhoneResponse> checkPhone(String phone) =>
      _signupDatasource.checkPhone(phone);

  Future<SignupResponses> signupConsumer(
          String phone, String password, String fullname, String otp) =>
      _signupDatasource.signupConsumer(phone, password, fullname, otp);
}
