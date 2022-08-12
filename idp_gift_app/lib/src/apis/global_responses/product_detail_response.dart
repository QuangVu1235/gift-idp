import 'package:json_annotation/json_annotation.dart';

part 'product_detail_response.g.dart';

@JsonSerializable()
class DataProductDetailResponses {
  DataProductDetailResponses();

  factory DataProductDetailResponses.fromJson(Map<String, dynamic> json) =>
      _$DataProductDetailResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductDetailResponsesToJson(this);

  @JsonKey(name: 'data')
  ProductDetailResponses? data;
}

@JsonSerializable()
class ProductDetailResponses {
  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'old_product_price_formatted')
  String? oldProductPriceFormatted;

  @JsonKey(name: 'weight')
  double? weight;
  @JsonKey(name: 'old_product_price')
  double? oldProductPrice;

  @JsonKey(name: 'technical')
  List<TechnicalProductDetailResponses>? technical;

  // @JsonKey(name: 'retail_price_formatted')
  String? get retail_price_formatted => original_price_formatted;

  @JsonKey(name: 'profit_formatted')
  String? profit_formatted;


  ProductDetailResponses(
      {this.slug,
      this.oldProductPriceFormatted,
      this.weight,
      this.oldProductPrice,
      this.profit_formatted,
      this.id,
      this.code,
      this.name,
      this.price_formatted,
      this.special_formatted,
      this.special_percentage_formatted,
      this.thumbnail,
      this.percentage_price_old,
      this.original_price_formatted,
      this.gallery_images,
      this.qty,
      this.star,
      this.qtySale,
      this.description,
      this.sold_count,
      this.favoritesCount,
      this.weightClass,});

  factory ProductDetailResponses.fromJson(Map<String, dynamic> json) => _$ProductDetailResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailResponsesToJson(this);

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

  @JsonKey(name: 'original_price_formatted')
  String? original_price_formatted;

  @JsonKey(name: 'gallery_images')
  List<galleryImages>? gallery_images;

  @JsonKey(name: 'qty')
  int? qty;

  @JsonKey(name: "star")
  Star? star;

  @JsonKey(name: "qty_sale")
  dynamic qtySale;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "sold_count")
  int? sold_count;

  @JsonKey(name: "favorites_count")
  dynamic favoritesCount;
  @JsonKey(name: 'weight_class')
  String? weightClass;
  // @JsonKey(name: 'net_price_formatted')
  String? get net_price_formatted => price_formatted;
}

@JsonSerializable()
class galleryImages {
  galleryImages();

  factory galleryImages.fromJson(Map<String, dynamic> json) =>
      _$galleryImagesFromJson(json);

  Map<String, dynamic> toJson() => _$galleryImagesToJson(this);
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'url')
  dynamic url;
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

@JsonSerializable()
class TechnicalProductDetailResponses {
  TechnicalProductDetailResponses({this.title, this.content});
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'content')
  String? content;

  factory TechnicalProductDetailResponses.fromJson(Map<String, dynamic> json) => _$TechnicalProductDetailResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$TechnicalProductDetailResponsesToJson(this);
}
