// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProductDetailResponses _$DataProductDetailResponsesFromJson(
        Map<String, dynamic> json) =>
    DataProductDetailResponses()
      ..data = json['data'] == null
          ? null
          : ProductDetailResponses.fromJson(
              json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$DataProductDetailResponsesToJson(
        DataProductDetailResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductDetailResponses _$ProductDetailResponsesFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponses(
      slug: json['slug'] as String?,
      oldProductPriceFormatted: json['old_product_price_formatted'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      oldProductPrice: (json['old_product_price'] as num?)?.toDouble(),
      profit_formatted: json['profit_formatted'] as String?,
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      price_formatted: json['price_formatted'] as String?,
      special_formatted: json['special_formatted'] as String?,
      special_percentage_formatted:
          json['special_percentage_formatted'] as String?,
      thumbnail: json['thumbnail'],
      percentage_price_old: json['percentage_price_old'] as String?,
      original_price_formatted: json['original_price_formatted'] as String?,
      gallery_images: (json['gallery_images'] as List<dynamic>?)
          ?.map((e) => galleryImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      qty: json['qty'] as int?,
      star: json['star'] == null
          ? null
          : Star.fromJson(json['star'] as Map<String, dynamic>),
      qtySale: json['qty_sale'],
      description: json['description'] as String?,
      sold_count: json['sold_count'] as int?,
      favoritesCount: json['favorites_count'],
      weightClass: json['weight_class'] as String?,
    )..technical = (json['technical'] as List<dynamic>?)
        ?.map((e) =>
            TechnicalProductDetailResponses.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ProductDetailResponsesToJson(
        ProductDetailResponses instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'old_product_price_formatted': instance.oldProductPriceFormatted,
      'weight': instance.weight,
      'old_product_price': instance.oldProductPrice,
      'technical': instance.technical,
      'profit_formatted': instance.profit_formatted,
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'price_formatted': instance.price_formatted,
      'special_formatted': instance.special_formatted,
      'special_percentage_formatted': instance.special_percentage_formatted,
      'thumbnail': instance.thumbnail,
      'percentage_price_old': instance.percentage_price_old,
      'original_price_formatted': instance.original_price_formatted,
      'gallery_images': instance.gallery_images,
      'qty': instance.qty,
      'star': instance.star,
      'qty_sale': instance.qtySale,
      'description': instance.description,
      'sold_count': instance.sold_count,
      'favorites_count': instance.favoritesCount,
      'weight_class': instance.weightClass,
    };

galleryImages _$galleryImagesFromJson(Map<String, dynamic> json) =>
    galleryImages()
      ..id = json['id'] as String?
      ..url = json['url'];

Map<String, dynamic> _$galleryImagesToJson(galleryImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };

Star _$StarFromJson(Map<String, dynamic> json) => Star()
  ..totalRate = json['total_rate'] == null
      ? null
      : TotalRate.fromJson(json['total_rate'] as Map<String, dynamic>)
  ..avgStar = json['avg_star'] == null
      ? null
      : AvgStar.fromJson(json['avg_star'] as Map<String, dynamic>);

Map<String, dynamic> _$StarToJson(Star instance) => <String, dynamic>{
      'total_rate': instance.totalRate,
      'avg_star': instance.avgStar,
    };

AvgStar _$AvgStarFromJson(Map<String, dynamic> json) =>
    AvgStar()..avg = (json['avg'] as num?)?.toDouble();

Map<String, dynamic> _$AvgStarToJson(AvgStar instance) => <String, dynamic>{
      'avg': instance.avg,
    };

TotalRate _$TotalRateFromJson(Map<String, dynamic> json) =>
    TotalRate()..total = json['total'];

Map<String, dynamic> _$TotalRateToJson(TotalRate instance) => <String, dynamic>{
      'total': instance.total,
    };

TechnicalProductDetailResponses _$TechnicalProductDetailResponsesFromJson(
        Map<String, dynamic> json) =>
    TechnicalProductDetailResponses(
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$TechnicalProductDetailResponsesToJson(
        TechnicalProductDetailResponses instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
