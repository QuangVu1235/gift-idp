import 'package:json_annotation/json_annotation.dart';
part 'user_address_response.g.dart';

@JsonSerializable()
class DataUserAddress {
  @JsonKey(name: 'data')
  List<UserAddressResponse>? data;

  DataUserAddress({this.data});

  factory DataUserAddress.fromJson(Map<String, dynamic> json) => _$DataUserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserAddressToJson(this);

}

@JsonSerializable()
class UserAddressResponse {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;

  @JsonKey(name: 'user_name')
  String? userName;

  @JsonKey(name: 'full_name')
  String? fullName;

  String? phone;

  @JsonKey(name: 'city_code')
  String? cityCode;

  @JsonKey(name: 'city_name')
  String? cityName;

  @JsonKey(name: 'district_code')
  String? districtCode;

  @JsonKey(name: 'district_name')
  String? districtName;

  @JsonKey(name: 'ward_code')
  String? wardCode;

  @JsonKey(name: 'ward_name')
  String? wardName;

  @JsonKey(name: 'street_address')
  String? streetAddress;

  @JsonKey(name: 'full_address')
  String? fullAddress;

  @JsonKey(name: 'is_default')
  int? isDefault;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'created_by')
  String? createdBy;

  @JsonKey(name: 'updated_by')
  String? updatedBy;

  UserAddressResponse(
      {this.id,
        this.userId,
        this.userName,
        this.fullName,
        this.phone,
        this.cityCode,
        this.cityName,
        this.districtCode,
        this.districtName,
        this.wardCode,
        this.wardName,
        this.streetAddress,
        this.fullAddress,
        this.isDefault,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy});

  factory UserAddressResponse.fromJson(Map<String, dynamic> json) => _$UserAddressResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressResponseToJson(this);

}