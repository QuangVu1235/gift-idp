  import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/signin/responses/list_user_phone_responses.dart';
import 'package:idp_gift_app/src/apis/signin/responses/signin_responses.dart';
import 'package:idp_gift_app/src/apis/signin/services/signin_api.dart';

abstract class SigninDatasource {
  Future<SigninResponses> signin(String phone, String password);
  Future<void> logout();
  Future<ListUserPhoneResponses> getUserByPhone(String phone);
}

@LazySingleton(as: SigninDatasource)
class SigninDataSourceImpl extends SigninDatasource {
  SigninDataSourceImpl(this._signinAPI);

  final SigninAPI _signinAPI;

  @override
  Future<SigninResponses> signin(String phone, String password)
  => _signinAPI.signin({
    "phone": phone,
    "password": password,
  });

  @override
  Future<void> logout() => _signinAPI.Logout();

  @override
  Future<ListUserPhoneResponses> getUserByPhone(String phone) => _signinAPI.getUserByPhone(phone);

}
