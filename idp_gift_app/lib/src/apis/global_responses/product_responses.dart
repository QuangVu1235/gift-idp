import 'package:json_annotation/json_annotation.dart';

part 'product_responses.g.dart';

@JsonSerializable()
class DataProductResponses {
  DataProductResponses();

  factory DataProductResponses.fromJson(Map<String, dynamic> json) =>
      _$DataProductResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductResponsesToJson(this);

  @JsonKey(name: 'data')
  List<ItemProductResponses>? data;
}

@JsonSerializable()
class ItemProductResponses {

  ItemProductResponses();

  factory ItemProductResponses.fromJson(Map<String, dynamic> json) =>
      _$ItemProductResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemProductResponsesToJson(this);

  @JsonKey(name: 'profit_formatted')
  String? profitFormatted;

  // @JsonKey(name: 'net_price_formatted')
  @JsonKey(name: 'original_price_formatted')
  String? retail_price_formatted;
  // String? netPriceFormatted;

  @JsonKey(name: 'sellout_formatted')
  String? selloutFormatted;

  @JsonKey(name: 'sold_count_formatted')
  String? soldCountFormat;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'price_formatted')
  String? price_formatted;

  @JsonKey(name: 'special_formatted')
  String? special_formatted;

  @JsonKey(name: 'special_percentage_formatted')
  String? special_percentage_formatted;

  @JsonKey(name: 'thumbnail')
  dynamic thumbnail;

  @JsonKey(name: 'percentage_price_old')
  String? percentage_price_old;

  // @JsonKey(name: 'retail_price_formatted')
  // dynamic retail_price_formatted;

  String? get netPriceFormatted => price_formatted;

  @JsonKey(name: "star")
  Star? star;

  @JsonKey(name: "sold_count")
  int? soldCount;
}

@JsonSerializable()
class Star {
  @JsonKey(name: "total_rate")
  TotalRate? totalRate;
  @JsonKey(name: "avg_star")
  AvgStar? avgStar;
  Star();

  factory Star.fromJson(Map<String, dynamic> json) => _$StarFromJson(json);

  Map<String, dynamic> toJson() => _$StarToJson(this);
}

@JsonSerializable()
class AvgStar {
  @JsonKey(name: "avg")
  double? avg;
  //@JsonKey(name: "avg_format")
  //String avgFormat;

  AvgStar();

  factory AvgStar.fromJson(Map<String, dynamic> json) =>
      _$AvgStarFromJson(json);

  Map<String, dynamic> toJson() => _$AvgStarToJson(this);
}

@JsonSerializable()
class TotalRate {
  @JsonKey(name: "total")
  dynamic total;

  TotalRate();

  factory TotalRate.fromJson(Map<String, dynamic> json) =>
      _$TotalRateFromJson(json);

  Map<String, dynamic> toJson() => _$TotalRateToJson(this);
}
