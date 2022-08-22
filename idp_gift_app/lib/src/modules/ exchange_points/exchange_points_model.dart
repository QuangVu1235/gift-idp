import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/address/city_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/district_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/ward_responses.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/usecases/address_usecase.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExChangePointsModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  final AddressUseCase _addressUseCase;
  RxList<GitExchangePointsResp> dataGiftExchangePoints = RxList.empty();
  final RxList<DataCityResponses> cities = RxList.empty();
  final Rx<String?> city = ''.obs;
  final RxList<DataDistrictResponses> districts = RxList.empty();
  final Rx<String?> district = ''.obs;
  final RxList<DataWardResponses> wards = RxList.empty();
  final Rx<String?> ward = ''.obs;
  final Rx<String?> searchProductName = ''.obs;
  final TextEditingController inPutSearch = TextEditingController();

  @override
  void initState() {
    refresh();
    loadCities();
  }

  ExChangePointsModel(this._customerUserCase, this._addressUseCase);

  Future<void> refresh() async {
    await getAllGiftExchangePoints('');
  }
  Future<void> getAllGiftExchangePoints(String search) async {
    loading(() async{
     await _customerUserCase.getAllGiftExchangePoints({
      'city_code': city.value ?? '',
      'district_code':district.value ?? '',
      'product_name': search

     }).then((value) => dataGiftExchangePoints.value = value.data ?? []
      );
    });
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
}