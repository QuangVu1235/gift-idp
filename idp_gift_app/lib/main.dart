import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/main_page.dart';
import 'package:idp_gift_app/src/modules/modules_store/main_page_store.dart';
import 'package:idp_gift_app/src/modules/signin_signup/app/signin/app/signin_screen.dart';
import 'package:idp_gift_app/src/modules/splashsreen/splashsreen.dart';
import 'package:idp_gift_app/src/themes/themes.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      getIt<MyApp>(),
    );
  });
}

@Injectable()
class MyApp extends StatelessWidget {
  final SharedPreferences _sharedPreferences;
  const MyApp(this._sharedPreferences);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'IDP',
      theme: Themes.mainTheme,
      home: SplashScreen(
          nextScreen: (_sharedPreferences.getString('uToken')?.isNotEmpty ??
                      false) &&
                  (_sharedPreferences.getString('ROLE') == 'GUEST')
              ? const MainPage()
              : (_sharedPreferences.getString('uToken')?.isNotEmpty ?? false) &&
                      (_sharedPreferences.getString('ROLE') == 'AGENT')
                  ? MainPageStore()
                  : SigninPage()),
    );
  }
}
