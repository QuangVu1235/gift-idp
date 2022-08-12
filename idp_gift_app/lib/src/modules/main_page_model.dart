//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import 'package:idp_gift_app/src/modules/signin_signup/app/signin/app/signin_screen.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';

@lazySingleton
class MainPageModel extends ViewModel {
  RxInt index = 0.obs;
  RxBool notification = false.obs;

  @override
  initState() {
    // iosSubscription = FirebaseMessaging.onMessage.listen((data) {
    //   notification.value=true;
    // });
    return super.initState();
  }

  void openLogin() {
    Get.to(const SigninPage());
  }

  void openFlashSale() {
    //Get.to(const FlashSalePage());
  }

  Future<void> openNotification() async {
    notification.value = false;
   // Get.to(NotificationScreen());
  }
}
