import 'package:json_annotation/json_annotation.dart';

part 'ward_responses.g.dart';

@JsonSerializable()
class WardResponses {
  WardResponses();
  factory WardResponses.fromJson(Map<String, dynamic> json) => _$WardResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$WardResponsesToJson(this);

  @JsonKey(name: 'data')
  List<DataWardResponses>? data;
}

@JsonSerializable()
class DataWardResponses {
  DataWardResponses();
  factory DataWardResponses.fromJson(Map<String, dynamic> json) => _$DataWardResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$DataWardResponsesToJson(this);

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'name')
  String? name;
  // @JsonKey(name: 'description')
  // Null? description;
  @JsonKey(name: 'district_code')
  String? districtCode;
  @JsonKey(name: 'district_name')
  String? districtName;
  @JsonKey(name: 'city_code')
  String? cityCode;
  @JsonKey(name: 'city_name')
  String? cityName;
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'country_name')
  String? countryName;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
}