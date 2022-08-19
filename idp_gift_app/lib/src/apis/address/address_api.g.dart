// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AddressAPI implements AddressAPI {
  _AddressAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://api-idp.newweb.vn:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CityResponses> getCities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CityResponses>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v0/1/cities',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CityResponses.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DistrictResponses> getDistricts(cityCode) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DistrictResponses>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v0/${cityCode}/districts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DistrictResponses.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WardResponses> getWards(districtCode) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WardResponses>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v0/${districtCode}/wards',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WardResponses.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
