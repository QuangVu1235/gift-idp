// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ForgetPasswordAPI implements ForgetPasswordAPI {
  _ForgetPasswordAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://uat-api-omni.mutosi.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MessageResponses> sendOtp(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MessageResponses>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/client/auth/reset-password/send-phone',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MessageResponses.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ForgetPasswordConfirmOtpResponses> checkOtp(phone, otp) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phone': phone,
      r'sms_code': otp
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ForgetPasswordConfirmOtpResponses>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/client/auth/reset-password/check-otp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ForgetPasswordConfirmOtpResponses.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MessageResponses> changePasswordByToken(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MessageResponses>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/client/auth/reset-password',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MessageResponses.fromJson(_result.data!);
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
