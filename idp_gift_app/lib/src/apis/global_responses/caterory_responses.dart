import 'package:json_annotation/json_annotation.dart';

part 'caterory_responses.g.dart';

@JsonSerializable()
class DataCaterroryResponses {
  DataCaterroryResponses();

  factory DataCaterroryResponses.fromJson(Map<String, dynamic> json) =>
      _$DataCaterroryResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$DataCaterroryResponsesToJson(this);

  @JsonKey(name: 'data')
  List<ItemCateroryResponses>? data;
}

@JsonSerializable()
class ItemCateroryResponses {
  ItemCateroryResponses();

  factory ItemCateroryResponses.fromJson(Map<String, dynamic> json) =>
      _$ItemCateroryResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCateroryResponsesToJson(this);

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'is_featured')
  dynamic isFeatured;

  @JsonKey(name: 'is_hot')
  dynamic isHot;

  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'image_url')
  dynamic image_url;
}
