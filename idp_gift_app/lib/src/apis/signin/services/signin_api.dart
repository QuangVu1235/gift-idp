import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/signin/responses/list_user_phone_responses.dart';
import 'package:idp_gift_app/src/apis/signin/responses/signin_responses.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:retrofit/http.dart';

part 'signin_api.g.dart';

@RestApi(baseUrl: BaseApi.idpRoot)
@LazySingleton()
abstract class SigninAPI {
  @factoryMethod
  factory SigninAPI(Dio dio) = _SigninAPI;

  @POST('client/auth/login')
  Future<SigninResponses> signin(@Body() Map<String, dynamic> map);

  @GET('/auth/logout')
  Future<void> Logout();

  @GET('/client/auth/list-users-by-phone/{phone}/HUB')
  Future<ListUserPhoneResponses> getUserByPhone(@Path('phone') String phone);

}
