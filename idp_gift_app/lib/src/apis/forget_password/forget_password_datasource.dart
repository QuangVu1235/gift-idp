import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/forget_password/services/forget_password_api.dart';
import 'package:idp_gift_app/src/apis/global_responses/message_responses.dart';
import 'responses/forget_password_cofirm_otp_responses.dart';

abstract class ForgetPasswordDatasource {

  Future<MessageResponses> sendOtp(String phone, {required String reCaptcha});
  Future<ForgetPasswordConfirmOtpResponses> checkOtp(String phone, String otp);
  Future<MessageResponses> changePasswordByToken(
    String userCode,
    String confirmPassword,
    String groupCode,
    String groupId,
    String password,
    String phone,
    String smsCode,
  );

}

@LazySingleton(as: ForgetPasswordDatasource)
class ForgetPasswordDatasourceImpl implements ForgetPasswordDatasource {
  ForgetPasswordDatasourceImpl(this._forgetPasswordAPI);
  final ForgetPasswordAPI _forgetPasswordAPI;

  @override
  Future<MessageResponses> changePasswordByToken(
    String userCode,
    String confirmPassword,
    String groupCode,
    String groupId,
    String password,
    String phone,
    String smsCode,
  ) {
    return _forgetPasswordAPI.changePasswordByToken({
      'code': userCode,
      'confirm_password': confirmPassword,
      'group_code': groupCode,
      'group_id':  groupId,
      'password': password,
      'phone': phone,
      'sms_code': smsCode,
    });
  }

  @override
  Future<ForgetPasswordConfirmOtpResponses> checkOtp(String phone, String otp)
  => _forgetPasswordAPI.checkOtp(phone, otp);

  @override
  Future<MessageResponses> sendOtp(String phone, {required String reCaptcha})
  => _forgetPasswordAPI.sendOtp({
    'phone': phone,
    'token': reCaptcha
  });

}