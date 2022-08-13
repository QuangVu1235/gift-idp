// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kun_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProductResponse _$DataProductResponseFromJson(Map<String, dynamic> json) =>
    DataProductResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataProductResponseToJson(
        DataProductResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      type: json['type'] as String?,
      tags: json['tags'] as String?,
      tax: json['tax'] as String?,
      cartInfo: (json['cart_info'] as List<dynamic>?)
          ?.map((e) => CartInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataCard: (json['data_card'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
      areaId: json['areaId'] as String?,
      areaName: json['areaName'] as String?,
      shopId: json['shopId'] as String?,
      shopName: json['shopName'] as String?,
      shortDescription: json['shortDescription'] as String?,
      description: json['description'] as String?,
      thumbnailId: json['thumbnailId'] as int?,
      thumbnail: json['thumbnail'] as String?,
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      storeSupermarket: json['storeSupermarket'] as int?,
      categorySupermarketIds: json['categorySupermarketIds'] as String?,
      categories: json['categories'] as String?,
      price: json['price'] as int?,
      priceFormatted: json['priceFormatted'] as String?,
      originalPrice: json['originalPrice'] as int?,
      originalPriceFormatted: json['originalPriceFormatted'] as String?,
      special: json['special'] as String?,
      specialFormated: json['specialFormated'] as String?,
      specialStartDate: json['specialStartDate'] as String?,
      specialEndDate: json['specialEndDate'] as String?,
      websiteIds: json['websiteIds'] as String?,
      realPrice: json['realPrice'] as String?,
      saleArea: (json['saleArea'] as List<dynamic>?)
          ?.map((e) => SaleArea.fromJson(e as Map<String, dynamic>))
          .toList(),
      priceDown: json['priceDown'] as String?,
      downRate: json['downRate'] as int?,
      downFrom: json['downFrom'] as String?,
      downTo: json['downTo'] as String?,
      handlingObject: json['handlingObject'] as String?,
      personalObject: json['personalObject'] as String?,
      enterpriseObject: json['enterpriseObject'] as String?,
      sku: json['sku'] as String?,
      upc: json['upc'] as String?,
      qty: json['qty'] as int?,
      length: json['length'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      lengthClass: json['lengthClass'] as String?,
      weightClass: json['weightClass'] as String?,
      weight: json['weight'] as int?,
      status: json['status'] as int?,
      order: json['order'] as int?,
      view: json['view'] as int?,
      storeId: json['storeId'] as int?,
      isFeatured: json['isFeatured'] as int?,
      isFeatureName: json['isFeatureName'] as String?,
      relatedIds: json['relatedIds'] as String?,
      comboLiked: json['comboLiked'] as String?,
      zaloSynced: json['zaloSynced'] as int?,
      exclusivePremium: json['exclusivePremium'] as String?,
      qtyOutMin: json['qtyOutMin'] as int?,
      customDateUpdated: json['customDateUpdated'] as String?,
      versionName: json['versionName'] as String?,
      point: json['point'] as int?,
      isGift: json['isGift'] as int?,
      numberOfCards: json['numberOfCards'] as int?,
      unitId: json['unitId'] as String?,
      unitCode: json['unitCode'] as String?,
      unitName: json['unitName'] as String?,
      orderCount: json['orderCount'] as int?,
      soldCount: json['soldCount'] as int?,
      publishStatus: json['publishStatus'] as String?,
      specificationId: json['specificationId'] as int?,
      specificationValue: json['specificationValue'] as String?,
      publishStatusName: json['publishStatusName'] as String?,
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'slug': instance.slug,
      'type': instance.type,
      'tags': instance.tags,
      'tax': instance.tax,
      'cart_info': instance.cartInfo,
      'data_card': instance.dataCard,
      'brandId': instance.brandId,
      'brandName': instance.brandName,
      'areaId': instance.areaId,
      'areaName': instance.areaName,
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'shortDescription': instance.shortDescription,
      'description': instance.description,
      'thumbnailId': instance.thumbnailId,
      'thumbnail': instance.thumbnail,
      'categoryIds': instance.categoryIds,
      'storeSupermarket': instance.storeSupermarket,
      'categorySupermarketIds': instance.categorySupermarketIds,
      'categories': instance.categories,
      'price': instance.price,
      'priceFormatted': instance.priceFormatted,
      'originalPrice': instance.originalPrice,
      'originalPriceFormatted': instance.originalPriceFormatted,
      'special': instance.special,
      'specialFormated': instance.specialFormated,
      'specialStartDate': instance.specialStartDate,
      'specialEndDate': instance.specialEndDate,
      'websiteIds': instance.websiteIds,
      'realPrice': instance.realPrice,
      'saleArea': instance.saleArea,
      'priceDown': instance.priceDown,
      'downRate': instance.downRate,
      'downFrom': instance.downFrom,
      'downTo': instance.downTo,
      'handlingObject': instance.handlingObject,
      'personalObject': instance.personalObject,
      'enterpriseObject': instance.enterpriseObject,
      'sku': instance.sku,
      'upc': instance.upc,
      'qty': instance.qty,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'lengthClass': instance.lengthClass,
      'weightClass': instance.weightClass,
      'weight': instance.weight,
      'status': instance.status,
      'order': instance.order,
      'view': instance.view,
      'storeId': instance.storeId,
      'isFeatured': instance.isFeatured,
      'isFeatureName': instance.isFeatureName,
      'relatedIds': instance.relatedIds,
      'comboLiked': instance.comboLiked,
      'zaloSynced': instance.zaloSynced,
      'exclusivePremium': instance.exclusivePremium,
      'qtyOutMin': instance.qtyOutMin,
      'customDateUpdated': instance.customDateUpdated,
      'versionName': instance.versionName,
      'point': instance.point,
      'isGift': instance.isGift,
      'numberOfCards': instance.numberOfCards,
      'unitId': instance.unitId,
      'unitCode': instance.unitCode,
      'unitName': instance.unitName,
      'orderCount': instance.orderCount,
      'soldCount': instance.soldCount,
      'publishStatus': instance.publishStatus,
      'specificationId': instance.specificationId,
      'specificationValue': instance.specificationValue,
      'publishStatusName': instance.publishStatusName,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt,
      'updatedBy': instance.updatedBy,
    };

SaleArea _$SaleAreaFromJson(Map<String, dynamic> json) => SaleArea(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SaleAreaToJson(SaleArea instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

Stores _$StoresFromJson(Map<String, dynamic> json) => Stores(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StoresToJson(Stores instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
