import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SplashsreenModel extends ViewModel {

  SplashsreenModel(this._sharedPreferences, this._dio);
  final SharedPreferences _sharedPreferences;
  // final UserUsecase _userUsecase;

  final Dio _dio;

  loadModel() async {
    if ((_sharedPreferences.getString('uToken') ?? '').isNotEmpty) {
     try{
       // await _userUsecase.getProfile();
     }catch(_){
       print(_);
     }
    }
    await delay(5);
  }

  Future<void> removeUToken() async {
    await _sharedPreferences.remove('uToken');
    _dio.options = BaseOptions(headers: {
      'Authorization': BaseApi.idpStoreToken,
    });
  }

  Future<bool> checkVersion() async{
   await Timer(Duration(seconds: 3), () {
      print("Yeah, this line is printed after 3 seconds");
    });
    // try {
    //   var flatform = await PackageInfo.fromPlatform();
    //   String versionNo = flatform.buildNumber;
    //   dynamic data = jsonEncode(await _userUsecase.getVersionApp());
    //   List<dynamic> listData = jsonDecode(data)?['data']?['data'] ?? [];
    //   String? currentVer = listData.firstWhere((dt) => dt['key'] == 'elite-mutosi', orElse: () => {})['value'];
    //   print('>>>>>>>>>>>> Checkver: cureent $currentVer >= admin: $versionNo');
    //   return (int.tryParse(currentVer ?? '0') ?? 0) <= (int.tryParse(versionNo) ?? 0);
    // }
    // catch (e) {
    //   loading(() async => throw 'Có lỗi khi kiểm tra phiên bản ứng dụng');
    // }
     return true;
  }

  Future delay(int s) async{
   await Future.delayed(const Duration(milliseconds: 5000), () {
    });
  }
  // Future loadProduct() async {
  //   await _productUscase.getListProductSelling();
  // }
  //
  // Future loadCaterory() async {
  //   await _cateroryUscase.getCategory();
  // }
  //
  // Future getMembershipRanks() async {
  //   await _memberShipUscase.getMembershipRanks();
  // }
}
