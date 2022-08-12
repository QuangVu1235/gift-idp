import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/global_responses/message_responses.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_check_otp_response.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_check_phone_response.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_responses.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:retrofit/http.dart';

part 'signup_api.g.dart';

@RestApi(baseUrl: BaseApi.mutosiRoot)
@LazySingleton()
abstract class SignupAPI {
  @factoryMethod
  factory SignupAPI(Dio dio) = _SignupAPI;

  @POST('/client/auth/register/send')
  Future<MessageResponses> sendOTP(@Query('phone') String phone,);

  @POST('/client/auth/register/check-otp')
  Future<SignupCheckOTPResponse> checkOTP(@Body() Map<String, dynamic> body);

  @GET('/v1/client/check-user-by-phone/{phone}')
  Future<SignupCheckPhoneResponse> checkPhone(@Path('phone') String phone);

  @POST('/client/auth/register/sms-register')
  Future<SignupResponses> signupConsumer(@Body() Map<String, dynamic> body);
}
