// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUserAddress _$DataUserAddressFromJson(Map<String, dynamic> json) =>
    DataUserAddress(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserAddressResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataUserAddressToJson(DataUserAddress instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserAddressResponse _$UserAddressResponseFromJson(Map<String, dynamic> json) =>
    UserAddressResponse(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      cityCode: json['city_code'] as String?,
      cityName: json['city_name'] as String?,
      districtCode: json['district_code'] as String?,
      districtName: json['district_name'] as String?,
      wardCode: json['ward_code'] as String?,
      wardName: json['ward_name'] as String?,
      streetAddress: json['street_address'] as String?,
      fullAddress: json['full_address'] as String?,
      isDefault: json['is_default'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
    );

Map<String, dynamic> _$UserAddressResponseToJson(
        UserAddressResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'full_name': instance.fullName,
      'phone': instance.phone,
      'city_code': instance.cityCode,
      'city_name': instance.cityName,
      'district_code': instance.districtCode,
      'district_name': instance.districtName,
      'ward_code': instance.wardCode,
      'ward_name': instance.wardName,
      'street_address': instance.streetAddress,
      'full_address': instance.fullAddress,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
