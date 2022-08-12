import 'package:json_annotation/json_annotation.dart';

part 'bool_data_response.g.dart';

@JsonSerializable()
class BoolDataResponse {
  @JsonKey(name: 'data')
  bool? data;

  BoolDataResponse();
  factory BoolDataResponse.fromJson(Map<String, dynamic> json) => _$BoolDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BoolDataResponseToJson(this);

}