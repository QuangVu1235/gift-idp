// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProductResponses _$DataProductResponsesFromJson(
        Map<String, dynamic> json) =>
    DataProductResponses()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => ItemProductResponses.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DataProductResponsesToJson(
        DataProductResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ItemProductResponses _$ItemProductResponsesFromJson(
        Map<String, dynamic> json) =>
    ItemProductResponses()
      ..profitFormatted = json['profit_formatted'] as String?
      ..retail_price_formatted = json['original_price_formatted'] as String?
      ..selloutFormatted = json['sellout_formatted'] as String?
      ..soldCountFormat = json['sold_count_formatted'] as String?
      ..id = json['id'] as int?
      ..code = json['code'] as String?
      ..name = json['name'] as String?
      ..price_formatted = json['price_formatted'] as String?
      ..special_formatted = json['special_formatted'] as String?
      ..special_percentage_formatted =
          json['special_percentage_formatted'] as String?
      ..thumbnail = json['thumbnail']
      ..percentage_price_old = json['percentage_price_old'] as String?
      ..star = json['star'] == null
          ? null
          : Star.fromJson(json['star'] as Map<String, dynamic>)
      ..soldCount = json['sold_count'] as int?;

Map<String, dynamic> _$ItemProductResponsesToJson(
        ItemProductResponses instance) =>
    <String, dynamic>{
      'profit_formatted': instance.profitFormatted,
      'original_price_formatted': instance.retail_price_formatted,
      'sellout_formatted': instance.selloutFormatted,
      'sold_count_formatted': instance.soldCountFormat,
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'price_formatted': instance.price_formatted,
      'special_formatted': instance.special_formatted,
      'special_percentage_formatted': instance.special_percentage_formatted,
      'thumbnail': instance.thumbnail,
      'percentage_price_old': instance.percentage_price_old,
      'star': instance.star,
      'sold_count': instance.soldCount,
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
