import 'package:idp_gift_app/src/apis/address/address_datasource.dart';
import 'package:idp_gift_app/src/apis/response/address/city_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/district_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/ward_responses.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddressUseCase {
  final AddressDataSource _addressDataSource;

  AddressUseCase(this._addressDataSource);

  CityResponses _cityResponses = CityResponses();
  DistrictResponses _districtResponses = DistrictResponses();
  WardResponses _wardResponses = WardResponses();
  

  Future<CityResponses> getCities() async {
    if ((_cityResponses.data?.length ?? 0) < 2) {
      _cityResponses = await _addressDataSource.getCities().then((value) {
        if (value.data?.isNotEmpty ?? false) {
          value.data?.insert(0, DataCityResponses());
        } else {
          value.data = [DataCityResponses()];
        }
        return value;
      });
    }
    return _cityResponses;
  }

  Future<DistrictResponses> getDistricts(String cityCode) async {
    if (cityCode.isEmpty) {
      return DistrictResponses.fromJson({
        'data': [DataDistrictResponses().toJson()]
      });
    }
    if ((_districtResponses.data?.length ?? 0) < 2 || _districtResponses.data?.first.code != cityCode) {
      _districtResponses = await _addressDataSource.getDistricts(cityCode).then((value) {
        if (value.data?.isNotEmpty ?? false) {
          value.data?.insert(0, DataDistrictResponses());
        } else {
          value.data = [DataDistrictResponses()];
        }
        return value;
      });
    }
    return _districtResponses;
  }

  Future<WardResponses> getWards(String districtCode) async {
    if (districtCode.isEmpty) {
      return WardResponses.fromJson({
        'data': [DataWardResponses().toJson()]
      });
    }
    if ((_wardResponses.data?.length ?? 0) < 2 || _wardResponses.data?.first.code != districtCode) {
      _wardResponses = await _addressDataSource.getWards(districtCode).then((value) {
        if (value.data?.isNotEmpty ?? false) {
          value.data?.insert(0, DataWardResponses());
        } else {
          value.data = [DataWardResponses()];
        }
        return value;
      });
    }
    return _wardResponses;
  }
  

}
