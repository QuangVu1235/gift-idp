import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_response.g.dart';

@JsonSerializable()
class CartDataReponse {

  @JsonKey(name: 'data')
  DataCardResponse? data;

  CartDataReponse({this.data});

  factory CartDataReponse.fromJson(Map<String, dynamic> json) =>
      _$CartDataReponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataReponseToJson(this);

}

@JsonSerializable()
class DataCardResponse{
  int? id;

  @JsonKey(name: 'user_id')
  int? userId;

  @JsonKey(name: 'session_id')
  String? sessionId;

  String? phone;

  String? address;

  @JsonKey(name: 'ship_address_latlong')
  String? shipAddressLatlong;

  @JsonKey(name: 'shipping_address_id')
  String? shippingAddressId;

  @JsonKey(name: 'address_window_id')
  String? addressWindowId;

  @JsonKey(name: 'street_address')
  String? streetAddress;

  @JsonKey(name: 'shipping_address_full_name')
  String? shippingAddressFullName;

  @JsonKey(name: 'shipping_address_ward')
  String? shippingAddressWard;

  @JsonKey(name: 'shipping_address_district')
  String? shippingAddressDistrict;

  @JsonKey(name: 'shipping_address_city')
  String? shippingAddressCity;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  @JsonKey(name: 'payment_method_name')
  String? paymentMethodName;

  @JsonKey(name: 'shipping_method')
  String? shippingMethod;

  @JsonKey(name: 'shipping_method_code')
  String? shippingMethodCode;

  @JsonKey(name: 'shipping_method_name')
  String? shippingMethodName;

  @JsonKey(name: 'shipping_service')
  String? shippingService;

  @JsonKey(name: 'is_freeship')
  int? isFreeship;

  @JsonKey(name: 'shipping_note')
  String? shippingNote;

  @JsonKey(name: 'shipping_diff')
  String? shippingDiff;

  @JsonKey(name: 'service_name')
  String? serviceName;

  @JsonKey(name: 'extra_service')
  String? extraService;

  @JsonKey(name: 'ship_fee')
  String? shipFee;

  @JsonKey(name: 'ship_fee_down')
  String? shipFeeDown;

  @JsonKey(name: 'estimated_deliver_time')
  String? estimatedDeliverTime;

  @JsonKey(name: 'lading_method')
  String? ladingMethod;

  @JsonKey(name: 'ship_fee_start')
  String? shipFeeStart;

  @JsonKey(name: 'receiving_time')
  String? receivingTime;

  @JsonKey(name: 'total')
  int? total;

  @JsonKey(name: 'customer_point')
  int? customerPoint;

  @JsonKey(name: 'customer_exchange_point')
  String? customerExchangePoint;

  @JsonKey(name: 'total_product_promotion')
  int? totalProductPromotion;

  @JsonKey(name: 'total_product')
  int? totalProduct;

  @JsonKey(name: 'total_product_promotion_fortmated')
  String? totalProductPromotionFortmated;

  @JsonKey(name: 'total_product_fortmated')
  String? totalProductFortmated;
  // List<Null>? promotion;

  @JsonKey(name: 'total_fortmated')
  String? totalFortmated;

  @JsonKey(name: 'total_quantity')
  int? totalQuantity;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'created_by')
  String? createdBy;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'updated_by')
  String? updatedBy;

  @JsonKey(name: 'details')
  List<Details>? details;

  @JsonKey(name: 'total_point')
  String? totalPoint;


  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'distributor_id')
  int? distributorId;

  @JsonKey(name: 'distributor_code')
  String? distributorCode;

  @JsonKey(name: 'distributor_name')
  String? distributorName;

  @JsonKey(name: 'distributor_phone')
  String? distributorPhone;

  @JsonKey(name: 'distributor_lat')
  String? distributorLat;

  @JsonKey(name: 'distributor_long')
  String? distributorLong;

  @JsonKey(name: 'distributor_postcode')
  String? distributorPostcode;

  @JsonKey(name: 'order_type')
  String? orderType;

  @JsonKey(name: 'distributor_city_code')
  String? distributorCityCode;

  @JsonKey(name: 'distributor_district_code')
  String? distributorDistrictCode;

  @JsonKey(name: 'distributor_ward_code')
  String? distributorWardCode;

  @JsonKey(name: 'distributor_city_name')
  String? distributorCityName;

  @JsonKey(name: 'distributor_district_name')
  String? distributorDistrictName;

  @JsonKey(name: 'distributor_ward_name')
  String? distributorWardName;

  @JsonKey(name: 'distributor_full_address')
  String? distributorFullAddress;

  @JsonKey(name: 'customer_city_code')
  String? customerCityCode;

  @JsonKey(name: 'customer_district_code')
  String? customerDistrictCode;

  @JsonKey(name: 'customer_ward_code')
  String? customerWardCode;

  @JsonKey(name: 'customer_city_name')
  String? customerCityName;

  @JsonKey(name: 'customer_district_name')
  String? customerDistrictName;

  @JsonKey(name: 'customer_ward_name')
  String? customerWardName;

  @JsonKey(name: 'customer_full_address')
  String? customerFullAddress;

  @JsonKey(name: 'customer_lat')
  String? customerLat;

  @JsonKey(name: 'customer_long')
  String? customerLong;

  @JsonKey(name: 'customer_postcode')
  String? customerPostcode;

  @JsonKey(name: 'total_weight')
  int? totalWeight;

  @JsonKey(name: 'notify_limit_weight')
  String? notifyLimitWeight;

  @JsonKey(name: 'seller_id')
  String? sellerId;

  @JsonKey(name: 'seller_code')
  String? sellerCode;

  @JsonKey(name: 'seller_name')
  String? sellerName;

  @JsonKey(name: 'notification_distributor')
  int? notificationDistributor;

  @JsonKey(name: 'shipping_error')
  String? shippingError;


  DataCardResponse(
      {this.id,
        this.userId,
        this.sessionId,
        this.phone,
        this.address,
        this.shipAddressLatlong,
        this.shippingAddressId,
        this.addressWindowId,
        this.streetAddress,
        this.shippingAddressFullName,
        this.shippingAddressWard,
        this.shippingAddressDistrict,
        this.shippingAddressCity,
        this.description,
        this.paymentMethod,
        this.paymentMethodName,
        this.shippingMethod,
        this.shippingMethodCode,
        this.shippingMethodName,
        this.shippingService,
        this.isFreeship,
        this.shippingNote,
        this.shippingDiff,
        this.serviceName,
        this.extraService,
        this.shipFee,
        this.shipFeeDown,
        this.estimatedDeliverTime,
        this.ladingMethod,
        this.shipFeeStart,
        this.receivingTime,
        this.total,
        this.customerPoint,
        this.customerExchangePoint,
        this.totalProductPromotion,
        this.totalProduct,
        this.totalProductPromotionFortmated,
        this.totalProductFortmated,
        // this.promotion,
        this.totalFortmated,
        this.totalQuantity,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.details,
        this.totalPoint,
        // this.cartInfo,
        this.fullName,
        // this.totals,
        this.email,
        this.distributorId,
        this.distributorCode,
        this.distributorName,
        this.distributorPhone,
        this.distributorLat,
        this.distributorLong,
        this.distributorPostcode,
        this.orderType,
        this.distributorCityCode,
        this.distributorDistrictCode,
        this.distributorWardCode,
        this.distributorCityName,
        this.distributorDistrictName,
        this.distributorWardName,
        this.distributorFullAddress,
        this.customerCityCode,
        this.customerDistrictCode,
        this.customerWardCode,
        this.customerCityName,
        this.customerDistrictName,
        this.customerWardName,
        this.customerFullAddress,
        this.customerLat,
        this.customerLong,
        this.customerPostcode,
        this.totalWeight,
        this.notifyLimitWeight,
        this.sellerId,
        this.sellerCode,
        this.sellerName,
        this.notificationDistributor,
        this.shippingError});

  factory DataCardResponse.fromJson(Map<String, dynamic> json) =>
      _$DataCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataCardResponseToJson(this);

}

@JsonSerializable()
class Details {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'cart_id')
  int? cartId;

  @JsonKey(name: 'product_id')
  int? productId;

  @JsonKey(name: 'product_code')
  String? productCode;

  @JsonKey(name: 'product_name')
  String? productName;

  @JsonKey(name: 'product_thumb')
  String? productThumb;

  @JsonKey(name: 'quantity')
  int? quantity;

  @JsonKey(name: 'product_unit')
  String? productUnit;

  @JsonKey(name: 'product_unit_name')
  String? productUnitName;

  @JsonKey(name: 'price')
  int? price;

  @JsonKey(name: 'card_info')
  List<CardInfo>? cartInfo;

  @JsonKey(name: 'card_code')
  String? cardCode;

  @JsonKey(name: 'price_formatted')
  String? priceFormatted;

  @JsonKey(name: 'total_price')
  int? totalPrice;

  @JsonKey(name: 'total_price_formatted')
  String? totalPriceFormatted;

  @JsonKey(name: 'special')
  int? special;

  @JsonKey(name: 'special_formatted')
  String? specialFormatted;

  @JsonKey(name: 'special_price')
  int? specialPrice;

  @JsonKey(name: 'special_price_formatted')
  String? specialPriceFormatted;

  @JsonKey(name: 'promotion_price')
  int? promotionPrice;

  @JsonKey(name: 'promotion_price_formatted')
  String? promotionPriceFormatted;

  @JsonKey(name: 'total_promotion_price')
  int? totalPromotionPrice;

  @JsonKey(name: 'total_promotion_price_formatted')
  String? totalPromotionPriceFormatted;

  @JsonKey(name: 'total')
  int? total;

  @JsonKey(name: 'total_gift_card')
  int? totalGiftCard;

  @JsonKey(name: 'total_formatted')
  String? totalFormatted;

  @JsonKey(name: 'note')
  String? note;
  // List<Null>? options;

  @JsonKey(name: 'option_details')
  String? optionDetails;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'created_by')

  String? createdBy;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'updated_by')
  String? updatedBy;

  Details(
      {
        this.id,
        this.cartId,
        this.productId,
        this.productCode,
        this.productName,
        this.productThumb,
        this.quantity,
        this.productUnit,
        this.productUnitName,
        this.price,
        this.cartInfo,
        this.cardCode,
        this.priceFormatted,
        this.totalPrice,
        this.totalPriceFormatted,
        this.special,
        this.specialFormatted,
        this.specialPrice,
        this.specialPriceFormatted,
        this.promotionPrice,
        this.promotionPriceFormatted,
        this.totalPromotionPrice,
        this.totalPromotionPriceFormatted,
        this.total,
        this.totalGiftCard,
        this.totalFormatted,
        this.note,
        // this.options,
        this.optionDetails,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy
      });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);

}