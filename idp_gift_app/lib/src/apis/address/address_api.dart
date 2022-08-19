import 'dart:ui';

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
  factory AddressAPI(Dio dio) => _AddressAPI(dio);

  @_retrofit.GET('/v0/1/cities')
  Future<CityResponses> getCities();

  @_retrofit.GET('/v0/{city_code}/districts')
  Future<DistrictResponses> getDistricts(@_retrofit.Path('city_code') String cityCode);

  @_retrofit.GET('/v0/{district_code}/wards')
  Future<WardResponses> getWards(@_retrofit.Path('district_code') String districtCode);

}
