import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/address/city_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/district_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/apis/response/address/ward_responses.dart';
import 'package:idp_gift_app/src/usecases/address_usecase.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressModel extends ViewModel {
  final CustomerUserCase _customerUserCase;
  final AddressUseCase _addressUseCase;

  void Function(UserAddressResponse value)? confirmAddress;
  AddAddressModel(this._customerUserCase, this._addressUseCase);

  UserAddressResponse? defaultAddress;

  TextEditingController inputfullname = TextEditingController();
  TextEditingController inputAddress = TextEditingController();
  TextEditingController inputPhone = TextEditingController();
  RxBool checkIsDefault = false.obs;

  GlobalKey<FormState> fromKey = GlobalKey();

  // 3 ô select
  final RxList<DataCityResponses> cities = RxList.empty();
  final Rx<String?> city = ''.obs;
  final RxList<DataDistrictResponses> districts = RxList.empty();
  final Rx<String?> district = ''.obs;
  final RxList<DataWardResponses> wards = RxList.empty();
  final Rx<String?> ward = ''.obs;
  final RxString validCity = ''.obs;
  final RxString validDistrict = ''.obs;
  final RxString validWard = ''.obs;

  @override
  void initState(){
    loading(() async => await Future.wait([loadCities(),])).then((value) {
      if (defaultAddress != null) {
        inputPhone.text = defaultAddress?.phone ?? '';
        inputfullname.text = defaultAddress?.fullName ?? '';
        checkIsDefault.value = (defaultAddress?.isDefault ?? 0) == 1;
        inputAddress.text = defaultAddress?.streetAddress ?? '';
        city.value = defaultAddress?.cityCode;
        loadDistricts().then((value) {
          district.value = defaultAddress?.districtCode;
          loadWards().then((value) {
            ward.value = defaultAddress?.wardCode;
          });
        });
      }
    });
  }

  onChangeIsDefault() {
    checkIsDefault.value = !checkIsDefault.value;
  }

  Future<void> loadCities() async {
    await _addressUseCase.getCities().then((value) {
      cities.value = value.data ?? [DataCityResponses()];
      city.value = cities.first.code ?? '';
    });
    await loadDistricts();
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

  bool validAll() {
    bool result = fromKey.currentState?.validate() ?? false;
    if (city.value?.isEmpty ?? false) {
      validCity.value = 'Vui lòng chọn Tỉnh/ Thành phố';
      result = false;
    }
    else {
      validCity.value = '';
    }
    if (district.value?.isEmpty ?? false) {
      validDistrict.value = 'Vui lòng chọn Quận/ Huyện';
      result = false;
    }
    else {
      validDistrict.value = '';
    }
    if (ward.value?.isEmpty ?? false) {
      validWard.value = 'Vui lòng chọn Phường/ Xã';
      result = false;
    }
    else {
      validWard.value = '';
    }
    return result;
  }

  void btnConfirm() async {
    if (!validAll()) {
      await loading(() => throw 'Vui lòng kiểm tra lại thông tin');
      return;
    }

    if (null != confirmAddress) {
      DataCityResponses? cityName = cities.firstWhere((element) => element.code == city.value);
      DataDistrictResponses? districtName = districts.firstWhere((element) => element.code == district.value);
      DataWardResponses? wardName = wards.firstWhere((element) => element.code == ward.value);
      UserAddressResponse result = UserAddressResponse(
        fullName: inputfullname.text,
        phone: inputPhone.text,
        cityCode: city.value!,
        districtCode: district.value!,
        wardCode: ward.value!,
        streetAddress: inputAddress.text,
        cityName: cityName.name,
        districtName: districtName.name,
        wardName: wardName.name,
        fullAddress: '${inputAddress.text}, ${wardName.name}, ${districtName.name}, ${cityName.name}',
      );
      confirmAddress!(result);
      return;
    }
    UserAddressResponse? request;
    await loading(() async {
      if (null == defaultAddress) {
        await _customerUserCase.doPostAddressUser(
          request = UserAddressResponse(
            fullName: inputfullname.text,
            streetAddress: inputAddress.text,
            phone: inputPhone.text,
            cityCode: city.value!,
            districtCode: district.value!,
            wardCode: ward.value!,
            isDefault: 0,
          )
        );
      }
      else {
        await _customerUserCase.doPutAddressUser(
          defaultAddress?.id.toString() ?? '',
          request = UserAddressResponse(
            id: defaultAddress?.id,
            phone: inputPhone.text,
            cityCode: city.value!,
            districtCode: district.value!,
            wardCode: ward.value!,
            fullName: inputfullname.text,
            streetAddress: inputAddress.text,
            isDefault: 0
            // isDefault: checkIsDefault.value,
          )
        );
      }
    });
    Get.back();
  }

}
