import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/address/city_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/district_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/ward_responses.dart';
import 'package:idp_gift_app/src/usecases/address_usecase.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/usecases/upload_file_usecase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SettingProfileModel extends ViewModel {
  final SharedPreferences _sharedPreferences;
  final UploadFileUsecase _fileUsecase;
  final CustomerUserCase _customerUserCase;
  final AddressUseCase _addressUseCase;
  final Rx<XFile?> imgUpload = Rx<XFile?>(null);
  final TextEditingController full_name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();

  final TextEditingController role_name = TextEditingController();
  final TextEditingController ranking_name = TextEditingController();
  final TextEditingController id = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString avartar = ''.obs;
  final RxInt inputGender = (-1).obs;
  final RxList<DataWardResponses> wards = RxList.empty();
  final RxList<DataDistrictResponses> districts = RxList.empty();
  final RxList<DataCityResponses> cities = RxList.empty();
  final Rx<String?> city = ''.obs;
  final RxString validCity = ''.obs;
  final RxString validGender = ''.obs;
  final RxString validDistrict = ''.obs;
  final Rx<String?> district = ''.obs;
  final Rx<String?> ward = ''.obs;
  final RxString validWard = ''.obs;

  // final Rx<DataUserResponese?> dataUser = Rx(null);

  String idImages = '';

  SettingProfileModel(this._sharedPreferences, this._fileUsecase, this._customerUserCase, this._addressUseCase);
  @override
  void initState() {
    super.initState();
    loading(() async {
      await loadCities();
    });
  }

  Future<void> loadDistricts() async {
    await _addressUseCase.getDistricts(city.value ?? '').then((value) {
      districts.value = value.data ?? [DataDistrictResponses()];
      district.value = districts.first.code ?? '';
    });
    await loadWards();
  }

  Future<void> loadWards() async {
    await _addressUseCase.getWards(district.value ?? '').then((value) {
      wards.value = value.data ?? [DataWardResponses()];
      ward.value = wards.first.code ?? '';
    });
  }

  Future<void> loadCities() async {
    await _addressUseCase.getCities().then((value) {
      cities.value = value.data ?? [DataCityResponses()];
      city.value = cities.first.code ?? '';
    });
    await loadDistricts();
  }

  // Future<void> refreshForm() async =>
  //     _userUsecase.getProfile().then((value) async {
  //       dataUser.value = value;
  //
  //       city.value = value.data?.city_code ?? '';
  //       city.value!.isNotEmpty ? await loadDistricts() : '';
  //       district.value = value.data?.district_code ?? '';
  //       district.value!.isNotEmpty ? await loadWards() : '';
  //       ward.value = value.data?.ward_code ?? '';
  //       avartar.value = value.data?.link_avatar ?? '';
  //       full_name.text = value.data?.full_name ?? '';
  //       id.text = value.data?.code??'';
  //       ranking_name.text = value.data?.ranking_name ?? 'Chưa có hạng';
  //       role_name.text = value.data?.group_name ?? '';
  //       //inputDate.text = value.data?.birthday ?? '';
  //       inputGender.value = int.parse(value.data?.gender
  //           ?.replaceFirst('M', '1')
  //           .replaceFirst('F', '0')
  //           .replaceFirst('O', '3') ??
  //           '-1'); // Man => 1, Woman => 0, Other => 3
  //       phone.text = value.data?.phone ?? '';
  //       address.text = value.data?.streetAddress ?? value.data?.address ?? '';
  //
  //       email.text = value.data?.email ?? '';
  //       //inputIdCard.text = value.data?.idNumber ?? '';
  //       // city.value = value.data?.registerCity ?? '';
  //       // district.value = value.data?.registerDistrict ?? '';
  //       // ward.value = value.data?.registerWard ?? '';
  //
  //       // city.value = '';
  //       // district.value = '';
  //       // ward.value = '';
  //       // inputAddress.text = '';
  //       // bank.value = '';
  //       // inputBankNum.text = '';
  //       // inputBankName.text = '';
  //     });

  bool validAll() {
    bool result = formKey.currentState?.validate() ?? true;
    if (city.value?.isEmpty ?? false) {
      validCity.value = 'Vui lòng chọn Tỉnh/ Thành phố';
      result = false;
    } else {
      validCity.value = '';
    }
    if (district.value?.isEmpty ?? false) {
      validDistrict.value = 'Vui lòng chọn Quận/ Huyện';
      result = false;
    } else {
      validDistrict.value = '';
    }
    if (ward.value?.isEmpty ?? false) {
      validWard.value = 'Vui lòng chọn Phường/ Xã';
      result = false;
    } else {
      validWard.value = '';
    }

    return result;
  }

  // updateProfile() async {
  //   if (!validAll() || !(formKey.currentState!.validate())) {
  //     loading(() async {
  //       throw 'Dữ liệu không đúng\nVui lòng kiểm tra lại thông tin!';
  //     });
  //     return;
  //   }
  //   loading(() async {
  //     if ((imgUpload.value?.path ?? '').isNotEmpty) {
  //       UploadFileResponses file1 =
  //       await _fileUsecase.upload(File(imgUpload.value?.path ?? ''));
  //       idImages = '${file1.id}';
  //       if ((file1.id?.isEmpty ?? false)) {
  //         throw 'Có lỗi khi upload hình ảnh';
  //       }
  //       await _userUsecase.updateProfile({
  //         'full_name': full_name.text,
  //         'gender': inputGender.value == 0
  //             ? 'F'
  //             : (inputGender.value == 1 ? 'M' : 'O'),
  //         'city_code': city.value,
  //         'district_code': district.value,
  //         'ward_code': ward.value,
  //         'street_address': address.text,
  //         'address': address.text,
  //         'avatar': idImages,
  //         'email': email.text
  //       }).then((value) async {
  //         print('1234');
  //
  //         refresh();
  //         _sharedPreferences.setString("refresh", "refresh");
  //       });
  //     } else {
  //       await _userUsecase.updateProfile({
  //         'full_name': full_name.text,
  //         'gender': inputGender.value == 0
  //             ? 'F'
  //             : (inputGender.value == 1 ? 'M' : 'O'),
  //         'city_code': city.value,
  //         'district_code': district.value,
  //         'ward_code': ward.value,
  //         'street_address': address.text,
  //         'address': address.text,
  //         'email': email.text
  //       }).then((value) async {
  //         print('123');
  //         refresh();
  //         _sharedPreferences.setString("refresh", "refresh");
  //       });
  //     }
  //   });
  // }

  // refresh() async {
  //   await _userUsecase.refreshProfile().then((value) {
  //     AppUtils().showPopup(
  //         title: 'Thay đổi thành công',
  //         subtitle: 'Thông tin của bạn cập nhập thành công',
  //         isSuccess: true,
  //         action: [
  //           SizedBox(
  //             child: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 primary: UIColors.black70,
  //               ),
  //               onPressed: () {
  //                 Get.offAll(const MainPage(
  //                   indexTab: 4,
  //                 ));
  //               },
  //               child: const Padding(
  //                 padding: EdgeInsets.only(
  //                     left: SpaceValues.space16, right: SpaceValues.space16),
  //                 child: Text(
  //                   'Xác nhận',
  //                   style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
  //                 ),
  //               ),
  //             ),
  //           )
  //         ]);
  //   });
  // }

  // logout() {
  //   _signinUsecase.logout().then((value) {
  //     _sharedPreferences.remove("uToken");
  //     getIt<Dio>().options = BaseOptions(headers: {
  //       'Authorization': BaseApi.mutosiStoreToken,
  //     });
  //     getIt<NumCartDetail>().setState(0);
  //     getIt<NumCartPoint>().setState(0);
  //     Get.offAll(MainPage());
  //   }).catchError((onError) {
  //     printError();
  //   });
  // }

  // Future<void> deleteUser() async {
  //   loading(() async {
  //     Fluttertoast.showToast(msg: 'Vui lòng chờ...', backgroundColor: UIColors.black70);
  //     await Future.delayed(const Duration(seconds: 5));
  //     Fluttertoast.showToast(msg: 'Vui lòng chờ...', backgroundColor: UIColors.black70);
  //     await Future.delayed(const Duration(seconds: 5));
  //     Fluttertoast.showToast(msg: 'Vui lòng chờ...', backgroundColor: UIColors.black70);
  //     return await _userUsecase.deleteUser();
  //   }).then((value) {
  //     logout();
  //   });
  // }

  bool checkPassword(String inputPass) {
    return inputPass == _sharedPreferences.getString("password");
  }

}
