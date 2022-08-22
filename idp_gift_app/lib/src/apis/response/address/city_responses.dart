import 'package:json_annotation/json_annotation.dart';

part 'city_responses.g.dart';

@JsonSerializable()
class CityResponses {
  CityResponses();
  factory CityResponses.fromJson(Map<String, dynamic> json) => _$CityResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$CityResponsesToJson(this);

  @JsonKey(name: 'data')
  List<DataCityResponses>? data;

}

@JsonSerializable()
class DataCityResponses {
  DataCityResponses();
  factory DataCityResponses.fromJson(Map<String, dynamic> json) => _$DataCityResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$DataCityResponsesToJson(this);

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'full_name')
  String? fullname;
  @JsonKey(name: 'description')
  String? description;
  // @JsonKey(name: 'region_code')
  // String? regionCode;
  // @JsonKey(name: 'region_name')
  // String? regionName;
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'country_name')
  String? countryName;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

}