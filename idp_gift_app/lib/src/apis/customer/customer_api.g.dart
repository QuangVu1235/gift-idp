// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _CustomerAPI implements CustomerAPI {
  _CustomerAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://api-idp.newweb.vn:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<void> addToCartCustomer(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'v1/client/add-to-cart-exchange-customer',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<CartDataReponse> getCartExchangeByUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartDataReponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/cart-exchange',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartDataReponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DataProductResponse> getProductByCode(code) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'code': code};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataProductResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/client/exchange-products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> deleteCart(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'DELETE', headers: _headers, extra: _extra)
        .compose(
            _dio.options, '/v1/client/remove-product-in-cart-exchange/${id}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<void> updateCart(id, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'PUT', headers: _headers, extra: _extra)
        .compose(
            _dio.options, 'v1/update-product-in-cart-exchange-customer/${id}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<dynamic> changeStatusOrder(id, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PUT', headers: _headers, extra: _extra)
            .compose(_dio.options, 'v1/orders-exchange/${id}/status',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<DataGitExchangePoints> getAllGiftExchangePoints() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataGitExchangePoints>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/client/get-gift-exchange-points',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataGitExchangePoints.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ProductResponse>> getAllProductExchangePoints(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ProductResponse>>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, 'v1/client/get-product-by-gift-exchange-points',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ProductResponse.fromJson(i as Map<String, dynamic>))
        .toList();
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
