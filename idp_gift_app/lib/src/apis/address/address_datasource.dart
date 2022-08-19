import 'package:idp_gift_app/src/apis/address/address_api.dart';
import 'package:idp_gift_app/src/apis/response/address/city_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/district_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/ward_responses.dart';
import 'package:injectable/injectable.dart';

abstract class AddressDataSource {

  Future<CityResponses> getCities();

  Future<DistrictResponses> getDistricts(String cityCode);

  Future<WardResponses> getWards(String districtCode);


}

@LazySingleton(as: AddressDataSource)
class AddressDataSourceImpl extends AddressDataSource{
  AddressAPI brApi;
  AddressDataSourceImpl(this.brApi);

  @override
  Future<CityResponses> getCities() => brApi.getCities();

  @override
  Future<DistrictResponses> getDistricts(String cityCode) =>
      brApi.getDistricts(cityCode);

  @override
  Future<WardResponses> getWards(String districtCode) =>
      brApi.getWards(districtCode);



}
