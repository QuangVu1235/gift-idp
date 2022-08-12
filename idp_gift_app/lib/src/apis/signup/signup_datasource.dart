import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/global_responses/message_responses.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_check_otp_response.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_check_phone_response.dart';
import 'package:idp_gift_app/src/apis/signup/responses/signup_responses.dart';
import 'package:idp_gift_app/src/apis/signup/services/signup_api.dart';

abstract class SignupDatasource {
  Future<MessageResponses> sendOTP(String phone);

  Future<SignupCheckOTPResponse> checkOTP(String phone, String otp);

  Future<SignupCheckPhoneResponse> checkPhone(String phone);

  Future<SignupResponses> signupConsumer(
      String phone, String password, String fullname, String otp);
}

@LazySingleton(as: SignupDatasource)
class SignupDataSourceImpl extends SignupDatasource {
  SignupDataSourceImpl(this._signupAPI);

  final SignupAPI _signupAPI;

  @override
  Future<MessageResponses> sendOTP(String phone) => _signupAPI.sendOTP(phone);

  @override
  Future<SignupCheckOTPResponse> checkOTP(String phone, String otp) {
    Map<String, dynamic> dataOtp = {
      'phone': phone,
      'sms_code': otp,
    };
    return _signupAPI.checkOTP(dataOtp);
  }

  @override
  Future<SignupCheckPhoneResponse> checkPhone(String phone) =>
      _signupAPI.checkPhone(phone);

  @override
  Future<SignupResponses> signupConsumer(
      String phone, String password, String fullname, String otp) async {
    var data = await _signupAPI.signupConsumer({
      'phone': phone,
      'password': password,
      'name': fullname,
      'sms_code': otp,
      // ID, CODE, NAME get in GRPUP_USER (https://api-mutosi.newweb.vn/v1/client/list_user_groups)
      'group_id': '144',
      'group_code': 'GUEST',
      'group_name': 'Consumers'
    });
    return data;
  }
}
