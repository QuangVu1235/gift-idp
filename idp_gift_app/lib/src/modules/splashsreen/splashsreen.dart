import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/splashsreen/splashsreen_model.dart';
import 'package:idp_gift_app/src/themes/themes.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  final Widget nextScreen;

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends ViewWidget<SplashScreen,SplashsreenModel> with TickerProviderStateMixin {

  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  )..repeat();

  bool loading = true;

  loadingScreen() async {
    if (!loading) {
      return;
    }
    loading = false;
    await viewModel.loadModel();
    Get.offAll(() => widget.nextScreen);
    // if (await viewModel.checkVersion()) {
    //   Get.offAll(() => widget.nextScreen);
    // }
    // else {
    //   Get.offAll(() => UpdateScreen());
    // }
  }

  @override
  void initState() {
    super.initState();
    loadingScreen();
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset( ImageAssets.imgLogobanner, height: 150),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: AnimatedBuilder(
                animation: animationController,
                child: Image.asset(
                  ImageAssets.icLoading,
                  height: 77,
                ),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: animationController.value * 2 * pi,
                    child: child,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  
  @override
  SplashsreenModel createViewModel() => getIt<SplashsreenModel>();
}

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      // appBar: AppBar(
      //   backgroundColor: UIColors.white,
      //   centerTitle: false,
      //   leading: const SizedBox(
      //     width: 0,
      //     height: 0,
      //   ),
      //   leadingWidth: 0,
      //   title: SvgPicture.asset(
      //     SvgImageAssets.imgLogo,
      //     fit: BoxFit.contain,
      //     height: 40,
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgImageAssets.imgLogo,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24,),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Đã có bản cập nhật mới trên Google Play và App Store. \nVui lòng cập nhật để trải nghiệm những tính năng mới và sửa các lỗi trong ứng dụng!',
              style: TextStyle(
                fontSize: 18,
                color: UIColors.brandA,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24,),
          ElevatedButton(
            onPressed: () async {
              if (Theme.of(context).platform.name == 'android') {
                launchUrlString('https://play.google.com/store/apps/details?id=com.mutosi.elite');
              }
              else {
                try {
                  launchUrlString('market://details?id=com.mutosi.elite');
                } catch (_) {
                  launchUrlString('https://apps.apple.com/app/id1621644332');
                }
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                'Cập nhật ngay',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

}