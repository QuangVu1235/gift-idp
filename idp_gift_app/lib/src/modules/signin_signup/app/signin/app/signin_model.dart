import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/modules/modules_store/main_page_store.dart';
import 'package:idp_gift_app/src/modules/modules_store/main_page_store_model.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/signin/responses/list_user_phone_responses.dart';
import 'package:idp_gift_app/src/apis/signin/responses/signin_responses.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_input_form_widget.dart';
import 'package:idp_gift_app/src/modules/main_page.dart';
import 'package:idp_gift_app/src/usecases/signin_usecase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
@injectable
class SigninModel extends ViewModel {
  final SigninUsecase signinUsecase;
  final SharedPreferences sharedPreferences;

  TextEditingController inputPhone = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  TextEditingController passtxt = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isShowPass = true.obs;
  RxBool checkPass = false.obs;
  RxString titleMessPass = ''.obs;
  Rxn<ListUserPhoneResponses> listUserResponse = Rxn();
  RxnString userSeletected = RxnString();

  SigninModel(this.signinUsecase, this.sharedPreferences);

  void onShowPass() {
    isShowPass.value = !isShowPass.value;
  }

  void errorPass(String title, bool check) {
    titleMessPass.value = title;
    checkPass.value = check;
  }

  void onForgetPassword() {
    //Get.to(() => const ForgetPassWordScreen());
  }

  void openMainPage() {
    inputPhone.text=='store'?Get.offAll(() => const MainPageStore()):Get.offAll(() => const MainPage());
  }



  void onLogin() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      // not validate or null
      return;
    }
    loading(() async {
      signinUsecase.getSessionIdResponseByPhone(inputPhone.text).then((value) {
          if(value.data?.sessionId != null){
            sharedPreferences.setString('uSessionId', value.data?.sessionId.toString() ?? '');
          }
      });
      SigninResponses value = await signinUsecase.signin(inputPhone.text, inputPassword.text);
      if ((value.token ?? '').isEmpty) {
        throw 'Số điện thoại hoặc mật khẩu không đúng';
      }
      Future.wait([
        sharedPreferences.setString('uPhone', inputPhone.text),
        sharedPreferences.setString('uToken', value.token ?? ''),
      ]);
      getIt<Dio>().options = BaseOptions(headers: {
        'Authorization': (value.token?.isNotEmpty ?? false)
        ? 'Bearer ${value.token}'
        : BaseApi.idpStoreToken,
      });
      if(value.groupCode == 'GUEST'){
        sharedPreferences.setString('ROLE', 'GUEST');
        Get.offAll(const MainPage(indexTab: 0,));
      }else if(value.groupCode == 'AGENT'){
        sharedPreferences.setString('ROLE', 'AGENT');
        Get.offAll(const MainPageStore(indexTab: 0,));
      }
    },reCatchString: false);
  }

  void onRegistration() {
   // Get.to(BusinessRegistration());
  }
  
}
