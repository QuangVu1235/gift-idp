import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/forget_password/forget_password_datasource.dart';
import 'package:idp_gift_app/src/apis/global_responses/message_responses.dart';
import '../apis/forget_password/responses/forget_password_cofirm_otp_responses.dart';

@LazySingleton()
class ForgetPasswordUsecase {

  final ForgetPasswordDatasource _forgetPasswordDatasource;

  @factoryMethod
  ForgetPasswordUsecase(this._forgetPasswordDatasource);

  Future<MessageResponses> changePasswordByToken({
    required String userCode,
    required String confirmPassword,
    required String groupCode,
    required String groupId,
    required String password,
    required String phone,
    required String smsCode,
  })
  => _forgetPasswordDatasource.changePasswordByToken(
    userCode,
    confirmPassword,
    groupCode,
    groupId,
    password,
    phone,
    smsCode,
  );

  Future<ForgetPasswordConfirmOtpResponses> checkOtp(String phone, String otp)
  => _forgetPasswordDatasource.checkOtp(phone, otp);

  Future<MessageResponses> sendOtp(String phone, {required String reCaptcha})
  => _forgetPasswordDatasource.sendOtp(phone, reCaptcha: reCaptcha);

}
