import 'package:json_annotation/json_annotation.dart';

part 'district_responses.g.dart';

@JsonSerializable()
class DistrictResponses {
  DistrictResponses();
  factory DistrictResponses.fromJson(Map<String, dynamic> json) => _$DistrictResponsesFromJson(json);
  Map<String,dynamic> toJson() => _$DistrictResponsesToJson(this);

  @JsonKey(name: 'data')
  List<DataDistrictResponses>? data;

}

@JsonSerializable()
class DataDistrictResponses {
  DataDistrictResponses();
  factory DataDistrictResponses.fromJson(Map<String, dynamic> json) => _$DataDistrictResponsesFromJson(json);
  Map<String,dynamic> toJson() => _$DataDistrictResponsesToJson(this);

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'name')
  String? name;
  // @JsonKey(name: 'description')
  // Null? description;
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