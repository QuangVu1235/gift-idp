import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/global_responses/message_responses.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:retrofit/http.dart';
import '../responses/forget_password_cofirm_otp_responses.dart';

part 'forget_password_api.g.dart';

@RestApi(baseUrl: BaseApi.mutosiRoot)
@LazySingleton()
abstract class ForgetPasswordAPI {

  @factoryMethod
  factory ForgetPasswordAPI(Dio dio) = _ForgetPasswordAPI;

  @POST('/client/auth/reset-password/send-phone')
  Future<MessageResponses> sendOtp(@Body() Map<String, dynamic> body,);

  @POST('/client/auth/reset-password/check-otp')
  Future<ForgetPasswordConfirmOtpResponses> checkOtp(@Query('phone') String phone, @Query('sms_code') String otp);

  @POST('/client/auth/reset-password')
  Future<MessageResponses> changePasswordByToken(@Body() Map<String, dynamic> body);

}