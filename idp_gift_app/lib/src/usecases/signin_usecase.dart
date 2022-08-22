import 'package:idp_gift_app/src/apis/signin/responses/session_id_response.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/signin/responses/list_user_phone_responses.dart';
import 'package:idp_gift_app/src/apis/signin/responses/signin_responses.dart';
import 'package:idp_gift_app/src/apis/signin/signin_datasource.dart';

@LazySingleton()
class SigninUsecase {
  final SigninDatasource _signinDatasource;
  @factoryMethod
  SigninUsecase(this._signinDatasource);

  Future<SigninResponses> signin(String phone, String password) => _signinDatasource.signin(phone, password);

  Future<DataSessionIdResponse> getSessionIdResponseByPhone(String phone)
  =>_signinDatasource.getSessionIdResponseByPhone(phone);

  Future<ListUserPhoneResponses> getUserByPhone(String phone) => _signinDatasource.getUserByPhone(phone);
  Future<void> logout() => _signinDatasource.logout();
}
