import 'package:dio/dio.dart';
import 'package:idp_gift_app/src/apis/response/address/city_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/district_responses.dart';
import 'package:idp_gift_app/src/apis/response/address/ward_responses.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/http.dart' as _retrofit;

part 'address_api.g.dart';

@lazySingleton
@_retrofit.RestApi(baseUrl: BaseApi.idpRoot)
abstract class AddressAPI {
  @factoryMethod
  factory AddressAPI(Dio dio) => AddressAPI(dio);

  @_retrofit.GET("v0/1/cities")
  Future<CityResponses> getCity();

  @_retrofit.GET("v0/1/cities")
  Future<CityResponses> getCityChange(@_retrofit.Queries() Map<String, dynamic> map);

  @_retrofit.GET("v0/{idcity}/districts")
  Future<DistrictResponses> getDistrict(@_retrofit.Path("idcity") String codeCity);

  @_retrofit.GET('v0/{districtId}/wards')
  Future<WardResponses> fetchWard(@_retrofit.Path("districtId") String districtId);

}
