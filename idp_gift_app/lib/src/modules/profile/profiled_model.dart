import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:idp_gift_app/src/modules/signin_signup/app/signin/app/signin_screen.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfiledModel extends ViewModel{
  final SharedPreferences sharedPreferences;

  ProfiledModel(this.sharedPreferences);

  Future<void> logout()async {
    sharedPreferences.remove('ROLE');
    sharedPreferences.remove('uToken');
    Get.offAll(const SigninPage());
  }

}