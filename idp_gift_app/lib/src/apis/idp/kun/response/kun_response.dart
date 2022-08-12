import 'package:json_annotation/json_annotation.dart';
part 'kun_response.g.dart';

@JsonSerializable()
class DataProductResponse{
  @JsonKey(name: 'data')
  List<ProductResponse>? data;
  DataProductResponse({this.data});
  factory DataProductResponse.fromJson(Map<String, dynamic> json) =>
      _$DataProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataProductResponseToJson(this);

}

@JsonSerializable()
class ProductResponse{
  int? id;
  String? code;
  String? name;
  String? slug;
  String? type;
  String? tags;
  String? tax;
  @JsonKey(name: 'data_card')
  List<String>? dataCard;
  String? brandId;
  String? brandName;
  String? areaId;
  String? areaName;
  String? shopId;
  String? shopName;
  String? shortDescription;
  String? description;
  int? thumbnailId;
  String? thumbnail;
  // Null? galleryImageIds;
  // List<Null>? galleryImages;
  List<String>? categoryIds;
  int? storeSupermarket;
  String? categorySupermarketIds;
  String? categories;
  int? price;
  String? priceFormatted;
  int? originalPrice;
  String? originalPriceFormatted;
  String? special;
  String? specialFormated;
  String? specialStartDate;
  String? specialEndDate;
  String? websiteIds;
  String? realPrice;
  List<SaleArea>? saleArea;
  String? priceDown;
  int? downRate;
  String? downFrom;
  String? downTo;
  String? handlingObject;
  String? personalObject;
  String? enterpriseObject;
  String? sku;
  String? upc;
  int? qty;
  int? length;
  int? width;
  int? height;
  String? lengthClass;
  String? weightClass;
  int? weight;
  int? status;
  int? order;
  int? view;
  int? storeId;
  int? isFeatured;
  String? isFeatureName;
  String? relatedIds;
  String? comboLiked;
  int? zaloSynced;
  String? exclusivePremium;
  // List<Null>? relatedProducts;
  int? qtyOutMin;
  String? customDateUpdated;
  String? versionName;
  int? point;
  int? isGift;
  int? numberOfCards;
  String? unitId;
  String? unitCode;
  String? unitName;
  // List<Stores>? stores;
  // List<Null>? options;
  // List<Null>? promotions;
  // List<Null>? discounts;
  // List<Null>? rewardPoints;
  // List<Null>? versions;
  int? orderCount;
  int? soldCount;
  String? publishStatus;
  int? specificationId;
  String? specificationValue;
  String? publishStatusName;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  ProductResponse(
      {this.id,
        this.code,
        this.name,
        this.slug,
        this.type,
        this.tags,
        this.tax,
        this.dataCard,
        this.brandId,
        this.brandName,
        this.areaId,
        this.areaName,
        this.shopId,
        this.shopName,
        this.shortDescription,
        this.description,
        this.thumbnailId,
        this.thumbnail,
        // this.galleryImageIds,
        // this.galleryImages,
        this.categoryIds,
        this.storeSupermarket,
        this.categorySupermarketIds,
        this.categories,
        this.price,
        this.priceFormatted,
        this.originalPrice,
        this.originalPriceFormatted,
        this.special,
        this.specialFormated,
        this.specialStartDate,
        this.specialEndDate,
        this.websiteIds,
        this.realPrice,
        this.saleArea,
        this.priceDown,
        this.downRate,
        this.downFrom,
        this.downTo,
        this.handlingObject,
        this.personalObject,
        this.enterpriseObject,
        this.sku,
        this.upc,
        this.qty,
        this.length,
        this.width,
        this.height,
        this.lengthClass,
        this.weightClass,
        this.weight,
        this.status,
        this.order,
        this.view,
        this.storeId,
        this.isFeatured,
        this.isFeatureName,
        this.relatedIds,
        this.comboLiked,
        this.zaloSynced,
        this.exclusivePremium,
        // this.relatedProducts,
        this.qtyOutMin,
        this.customDateUpdated,
        this.versionName,
        this.point,
        this.isGift,
        this.numberOfCards,
        this.unitId,
        this.unitCode,
        this.unitName,
        // this.stores,
        // this.options,
        // this.promotions,
        // this.discounts,
        // this.rewardPoints,
        // this.versions,
        this.orderCount,
        this.soldCount,
        this.publishStatus,
        this.specificationId,
        this.specificationValue,
        this.publishStatusName,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

}

@JsonSerializable()
class SaleArea {
  String? code;
  String? name;

  SaleArea({this.code, this.name});
  factory SaleArea.fromJson(Map<String, dynamic> json) =>
      _$SaleAreaFromJson(json);
  Map<String, dynamic> toJson() => _$SaleAreaToJson(this);

}

@JsonSerializable()
class Stores {
  int? id;
  String? code;
  String? name;

  Stores({this.id, this.code, this.name});
  factory Stores.fromJson(Map<String, dynamic> json) =>
      _$StoresFromJson(json);
  Map<String, dynamic> toJson() => _$StoresToJson(this);

}
