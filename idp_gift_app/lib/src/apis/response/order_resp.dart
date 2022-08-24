class DataOrderResponse {
  List<OrderResponse>? data;

  DataOrderResponse({this.data});

  DataOrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderResponse>[];
      json['data'].forEach((v) {
        data!.add(new OrderResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDetailOrderResponse {
  OrderResponse? data;
  DataDetailOrderResponse({this.data});

  DataDetailOrderResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new OrderResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderResponse {
  int? id;
  String? code;
  String? orderType;
  String? status;
  String? statusName;
  String? statusGrab;
  int? customerId;
  String? qrScan;
  String? codeShipping;
  String? customerName;
  String? customerCode;
  String? customerEmail;
  String? customerPhone;
  String? customerLat;
  String? customerLong;
  String? customerPostcode;
  String? customerPoint;
  String? customerStar;
  String? commentForCustomer;
  String? partnerId;
  List<CardInfo>? cardInfo;
  String? note;
  String? shippingAddressId;
  String? streetId;
  String? streetAddress;
  String? shippingAddressWard;
  String? shippingAddressWardCode;
  String? shippingAddressDistrict;
  String? shippingAddressDistrictCode;
  String? shippingAddressCity;
  String? shippingAddressCityCode;
  String? shippingAddressPhone;
  String? shippingAddressFullName;
  String? orderChannel;
  String? shippingAddress;
  String? couponCode;
  String? point;
  int? subTotalPrice;
  int? totalPrice;
  String? totalPriceFormatted;
  int? totalDiscount;
  int? paymentStatus;
  String? paymentMethod;
  String? paymentCode;
  String? paymentMethodName;
  // List<Null>? paymentHistory;
  String? paymentAmount;
  String? shippingMethod;
  String? shippingMethodCode;
  String? shippingMethodName;
  String? shippingService;
  String? shippingServiceName;
  String? shippingOrderCode;
  String? shippingServicePhone;
  String? extraService;
  String? shipFee;
  String? estimatedDeliverTime;
  String? shippingNote;
  int? isFreeShip;
  String? intersectionDistance;
  int? saving;
  String? savingFortmated;
  int? outvat;
  String? invoiceCityCode;
  String? invoiceCityName;
  String? invoiceDistrictCode;
  String? invoiceDistrictName;
  String? invoiceWardCode;
  String? invoiceWardName;
  String? invoiceStreetAddress;
  String? invoiceCompanyName;
  String? invoiceCustomerEmail;
  String? invoiceTax;
  String? invoiceCompanyAddress;
  String? trackingUrl;
  String? updatedDate;
  String? createdDate;
  String? completedDate;
  String? orderDate;
  String? deliveryTime;
  String? latlong;
  int? lat;
  int? long;
  String? canceledReason;
  String? canceledReasonAdmin;
  String? districtCode;
  String? districtFee;
  Geometry? geometry;
  // List<Null>? images;
  String? approver;
  String? approverName;
  int? totalPriceDown;
  String? partnerShipFee;
  String? partnerRevenueTotal;
  int? partnerIncome;
  String? shineRevenueTotal;
  int? shineIncome;
  List<Details>? details;
  String? discount;
  bool? equal;
  String? isShop;
  int? distributorId;
  String? distributorCode;
  String? distributorName;
  String? distributorEmail;
  String? distributorFullAddress;
  String? distributorPhone;
  String? distributorLat;
  String? distributorLong;
  String? distributorPostcode;
  String? distributorStatus;
  // List<Null>? statusHistories;
  String? deliveryStatusHistories;
  String? sellerId;
  String? sellerCode;
  String? sellerName;
  String? leaderId;
  String? leaderCode;
  String? leaderName;
  String? statusCrm;
  String? crmCheck;
  String? crmDescription;
  String? description;
  // List<Null>? freeItem;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? isTransport;
  String? isExportOrder;
  String? referenceCode;
  String? estimateReturnFrom;
  String? estimateReturnTo;
  int? commissionTotal;
  String? commissionTotalFormatted;
  int? commissionHub;
  String? commissionHubFormatted;
  int? percentCommissionHub;
  int? commissionLuukho;
  String? commissionLuukhoFormatted;
  int? percentCommissionLuukho;
  String? isCancelShipping;
  String? linkViewOrder;
  String? rejectReason;
  String? rejectBy;
  String? rejectDate;
  String? statusShipping;
  String? statusShippingText;

  OrderResponse(
      {this.id,
      this.code,
      this.orderType,
      this.status,
      this.statusName,
      this.statusGrab,
      this.customerId,
      this.qrScan,
      this.codeShipping,
      this.customerName,
      this.customerCode,
      this.customerEmail,
      this.customerPhone,
      this.customerLat,
      this.customerLong,
      this.customerPostcode,
      this.customerPoint,
      this.customerStar,
      this.commentForCustomer,
      this.partnerId,
      this.cardInfo,
      this.note,
      this.shippingAddressId,
      this.streetId,
      this.streetAddress,
      this.shippingAddressWard,
      this.shippingAddressWardCode,
      this.shippingAddressDistrict,
      this.shippingAddressDistrictCode,
      this.shippingAddressCity,
      this.shippingAddressCityCode,
      this.shippingAddressPhone,
      this.shippingAddressFullName,
      this.orderChannel,
      this.shippingAddress,
      this.couponCode,
      this.point,
      this.subTotalPrice,
      this.totalPrice,
      this.totalPriceFormatted,
      this.totalDiscount,
      this.paymentStatus,
      this.paymentMethod,
      this.paymentCode,
      this.paymentMethodName,
      // this.paymentHistory,
      this.paymentAmount,
      this.shippingMethod,
      this.shippingMethodCode,
      this.shippingMethodName,
      this.shippingService,
      this.shippingServiceName,
      this.shippingOrderCode,
      this.shippingServicePhone,
      this.extraService,
      this.shipFee,
      this.estimatedDeliverTime,
      this.shippingNote,
      this.isFreeShip,
      this.intersectionDistance,
      this.saving,
      this.savingFortmated,
      this.outvat,
      this.invoiceCityCode,
      this.invoiceCityName,
      this.invoiceDistrictCode,
      this.invoiceDistrictName,
      this.invoiceWardCode,
      this.invoiceWardName,
      this.invoiceStreetAddress,
      this.invoiceCompanyName,
      this.invoiceCustomerEmail,
      this.invoiceTax,
      this.invoiceCompanyAddress,
      this.trackingUrl,
      this.updatedDate,
      this.createdDate,
      this.completedDate,
      this.orderDate,
      this.deliveryTime,
      this.latlong,
      this.lat,
      this.long,
      this.canceledReason,
      this.canceledReasonAdmin,
      this.districtCode,
      this.districtFee,
      this.geometry,
      // this.images,
      this.approver,
      this.approverName,
      this.totalPriceDown,
      this.partnerShipFee,
      this.partnerRevenueTotal,
      this.partnerIncome,
      this.shineRevenueTotal,
      this.shineIncome,
      this.details,
      this.discount,
      this.equal,
      this.isShop,
      this.distributorId,
      this.distributorCode,
      this.distributorName,
      this.distributorEmail,
      this.distributorFullAddress,
      this.distributorPhone,
      this.distributorLat,
      this.distributorLong,
      this.distributorPostcode,
      this.distributorStatus,
      // this.statusHistories,
      this.deliveryStatusHistories,
      this.sellerId,
      this.sellerCode,
      this.sellerName,
      this.leaderId,
      this.leaderCode,
      this.leaderName,
      this.statusCrm,
      this.crmCheck,
      this.crmDescription,
      this.description,
      // this.freeItem,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.isTransport,
      this.isExportOrder,
      this.referenceCode,
      this.estimateReturnFrom,
      this.estimateReturnTo,
      this.commissionTotal,
      this.commissionTotalFormatted,
      this.commissionHub,
      this.commissionHubFormatted,
      this.percentCommissionHub,
      this.commissionLuukho,
      this.commissionLuukhoFormatted,
      this.percentCommissionLuukho,
      this.isCancelShipping,
      this.linkViewOrder,
      this.rejectReason,
      this.rejectBy,
      this.rejectDate,
      this.statusShipping,
      this.statusShippingText});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    orderType = json['order_type'];
    status = json['status'];
    statusName = json['status_name'];
    statusGrab = json['status_grab'];
    customerId = json['customer_id'];
    qrScan = json['qr_scan'];
    codeShipping = json['code_shipping'];
    customerName = json['customer_name'];
    customerCode = json['customer_code'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    customerLat = json['customer_lat'];
    customerLong = json['customer_long'];
    customerPostcode = json['customer_postcode'];
    customerPoint = json['customer_point'];
    customerStar = json['customer_star'];
    commentForCustomer = json['comment_for_customer'];
    partnerId = json['partner_id'];
    if (json['card_info'] != null) {
      cardInfo = <CardInfo>[];
      json['card_info'].forEach((v) {
        cardInfo!.add(new CardInfo.fromJson(v));
      });
    }
    note = json['note'];
    shippingAddressId = json['shipping_address_id'];
    streetId = json['street_id'];
    streetAddress = json['street_address'];
    shippingAddressWard = json['shipping_address_ward'];
    shippingAddressWardCode = json['shipping_address_ward_code'];
    shippingAddressDistrict = json['shipping_address_district'];
    shippingAddressDistrictCode = json['shipping_address_district_code'];
    shippingAddressCity = json['shipping_address_city'];
    shippingAddressCityCode = json['shipping_address_city_code'];
    shippingAddressPhone = json['shipping_address_phone'];
    shippingAddressFullName = json['shipping_address_full_name'];
    orderChannel = json['order_channel'];
    shippingAddress = json['shipping_address'];
    couponCode = json['coupon_code'];
    point = json['point'];
    subTotalPrice = json['sub_total_price'];
    totalPrice = json['total_price'];
    totalPriceFormatted = json['total_price_formatted'];
    totalDiscount = json['total_discount'];
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    paymentCode = json['payment_code'];
    paymentMethodName = json['payment_method_name'];
    // if (json['payment_history'] != null) {
    //   paymentHistory = <Null>[];
    //   json['payment_history'].forEach((v) {
    //     paymentHistory!.add(new Null.fromJson(v));
    //   });
    // }
    paymentAmount = json['payment_amount'];
    shippingMethod = json['shipping_method'];
    shippingMethodCode = json['shipping_method_code'];
    shippingMethodName = json['shipping_method_name'];
    shippingService = json['shipping_service'];
    shippingServiceName = json['shipping_service_name'];
    shippingOrderCode = json['shipping_order_code'];
    shippingServicePhone = json['shipping_service_phone'];
    extraService = json['extra_service'];
    shipFee = json['ship_fee'];
    estimatedDeliverTime = json['estimated_deliver_time'];
    shippingNote = json['shipping_note'];
    isFreeShip = json['is_free_ship'];
    intersectionDistance = json['intersection_distance'];
    saving = json['saving'];
    savingFortmated = json['saving_fortmated'];
    outvat = json['outvat'];
    invoiceCityCode = json['invoice_city_code'];
    invoiceCityName = json['invoice_city_name'];
    invoiceDistrictCode = json['invoice_district_code'];
    invoiceDistrictName = json['invoice_district_name'];
    invoiceWardCode = json['invoice_ward_code'];
    invoiceWardName = json['invoice_ward_name'];
    invoiceStreetAddress = json['invoice_street_address'];
    invoiceCompanyName = json['invoice_company_name'];
    invoiceCustomerEmail = json['invoice_customer_email'];
    invoiceTax = json['invoice_tax'];
    invoiceCompanyAddress = json['invoice_company_address'];
    trackingUrl = json['tracking_url'];
    updatedDate = json['updated_date'];
    createdDate = json['created_date'];
    completedDate = json['completed_date'];
    orderDate = json['order_date'];
    deliveryTime = json['delivery_time'];
    latlong = json['latlong'];
    lat = json['lat'];
    long = json['long'];
    canceledReason = json['canceled_reason'];
    canceledReasonAdmin = json['canceled_reason_admin'];
    districtCode = json['district_code'];
    districtFee = json['district_fee'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    // if (json['images'] != null) {
    //   images = <Null>[];
    //   json['images'].forEach((v) {
    //     images!.add(new Null.fromJson(v));
    //   });
    // }
    approver = json['approver'];
    approverName = json['approver_name'];
    totalPriceDown = json['total_price_down'];
    partnerShipFee = json['partner_ship_fee'];
    partnerRevenueTotal = json['partner_revenue_total'];
    partnerIncome = json['partner_income'];
    shineRevenueTotal = json['shine_revenue_total'];
    shineIncome = json['shine_income'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
    discount = json['discount'];
    equal = json['equal'];
    isShop = json['is_shop'];
    distributorId = json['distributor_id'];
    distributorCode = json['distributor_code'];
    distributorName = json['distributor_name'];
    distributorEmail = json['distributor_email'];
    distributorFullAddress = json['distributor_full_address'];
    distributorPhone = json['distributor_phone'];
    distributorLat = json['distributor_lat'];
    distributorLong = json['distributor_long'];
    distributorPostcode = json['distributor_postcode'];
    distributorStatus = json['distributor_status'];
    // if (json['status_histories'] != null) {
    //   statusHistories = <Null>[];
    //   json['status_histories'].forEach((v) {
    //     statusHistories!.add(new Null.fromJson(v));
    //   });
    // }
    deliveryStatusHistories = json['delivery_status_histories'];
    sellerId = json['seller_id'];
    sellerCode = json['seller_code'];
    sellerName = json['seller_name'];
    leaderId = json['leader_id'];
    leaderCode = json['leader_code'];
    leaderName = json['leader_name'];
    statusCrm = json['status_crm'];
    crmCheck = json['crm_check'];
    crmDescription = json['crm_description'];
    description = json['description'];
    // if (json['free_item'] != null) {
    //   freeItem = <Null>[];
    //   json['free_item'].forEach((v) {
    //     freeItem!.add(new Null.fromJson(v));
    //   });
    // }
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    isTransport = json['is_transport'];
    isExportOrder = json['is_export_order'];
    referenceCode = json['reference_code'];
    estimateReturnFrom = json['estimate_return_from'];
    estimateReturnTo = json['estimate_return_to'];
    commissionTotal = json['commission_total'];
    commissionTotalFormatted = json['commission_total_formatted'];
    commissionHub = json['commission_hub'];
    commissionHubFormatted = json['commission_hub_formatted'];
    percentCommissionHub = json['percent_commission_hub'];
    commissionLuukho = json['commission_luukho'];
    commissionLuukhoFormatted = json['commission_luukho_formatted'];
    percentCommissionLuukho = json['percent_commission_luukho'];
    isCancelShipping = json['is_cancel_shipping'];
    linkViewOrder = json['link_view_order'];
    rejectReason = json['reject_reason'];
    rejectBy = json['reject_by'];
    rejectDate = json['reject_date'];
    statusShipping = json['status_shipping'];
    statusShippingText = json['status_shipping_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['order_type'] = this.orderType;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    data['status_grab'] = this.statusGrab;
    data['customer_id'] = this.customerId;
    data['qr_scan'] = this.qrScan;
    data['code_shipping'] = this.codeShipping;
    data['customer_name'] = this.customerName;
    data['customer_code'] = this.customerCode;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
    data['customer_lat'] = this.customerLat;
    data['customer_long'] = this.customerLong;
    data['customer_postcode'] = this.customerPostcode;
    data['customer_point'] = this.customerPoint;
    data['customer_star'] = this.customerStar;
    data['comment_for_customer'] = this.commentForCustomer;
    data['partner_id'] = this.partnerId;
    if (this.cardInfo != null) {
      data['card_info'] = this.cardInfo!.map((v) => v.toJson()).toList();
    }
    data['note'] = this.note;
    data['shipping_address_id'] = this.shippingAddressId;
    data['street_id'] = this.streetId;
    data['street_address'] = this.streetAddress;
    data['shipping_address_ward'] = this.shippingAddressWard;
    data['shipping_address_ward_code'] = this.shippingAddressWardCode;
    data['shipping_address_district'] = this.shippingAddressDistrict;
    data['shipping_address_district_code'] = this.shippingAddressDistrictCode;
    data['shipping_address_city'] = this.shippingAddressCity;
    data['shipping_address_city_code'] = this.shippingAddressCityCode;
    data['shipping_address_phone'] = this.shippingAddressPhone;
    data['shipping_address_full_name'] = this.shippingAddressFullName;
    data['order_channel'] = this.orderChannel;
    data['shipping_address'] = this.shippingAddress;
    data['coupon_code'] = this.couponCode;
    data['point'] = this.point;
    data['sub_total_price'] = this.subTotalPrice;
    data['total_price'] = this.totalPrice;
    data['total_price_formatted'] = this.totalPriceFormatted;
    data['total_discount'] = this.totalDiscount;
    data['payment_status'] = this.paymentStatus;
    data['payment_method'] = this.paymentMethod;
    data['payment_code'] = this.paymentCode;
    data['payment_method_name'] = this.paymentMethodName;
    // if (this.paymentHistory != null) {
    //   data['payment_history'] =
    //       this.paymentHistory!.map((v) => v.toJson()).toList();
    // }
    data['payment_amount'] = this.paymentAmount;
    data['shipping_method'] = this.shippingMethod;
    data['shipping_method_code'] = this.shippingMethodCode;
    data['shipping_method_name'] = this.shippingMethodName;
    data['shipping_service'] = this.shippingService;
    data['shipping_service_name'] = this.shippingServiceName;
    data['shipping_order_code'] = this.shippingOrderCode;
    data['shipping_service_phone'] = this.shippingServicePhone;
    data['extra_service'] = this.extraService;
    data['ship_fee'] = this.shipFee;
    data['estimated_deliver_time'] = this.estimatedDeliverTime;
    data['shipping_note'] = this.shippingNote;
    data['is_free_ship'] = this.isFreeShip;
    data['intersection_distance'] = this.intersectionDistance;
    data['saving'] = this.saving;
    data['saving_fortmated'] = this.savingFortmated;
    data['outvat'] = this.outvat;
    data['invoice_city_code'] = this.invoiceCityCode;
    data['invoice_city_name'] = this.invoiceCityName;
    data['invoice_district_code'] = this.invoiceDistrictCode;
    data['invoice_district_name'] = this.invoiceDistrictName;
    data['invoice_ward_code'] = this.invoiceWardCode;
    data['invoice_ward_name'] = this.invoiceWardName;
    data['invoice_street_address'] = this.invoiceStreetAddress;
    data['invoice_company_name'] = this.invoiceCompanyName;
    data['invoice_customer_email'] = this.invoiceCustomerEmail;
    data['invoice_tax'] = this.invoiceTax;
    data['invoice_company_address'] = this.invoiceCompanyAddress;
    data['tracking_url'] = this.trackingUrl;
    data['updated_date'] = this.updatedDate;
    data['created_date'] = this.createdDate;
    data['completed_date'] = this.completedDate;
    data['order_date'] = this.orderDate;
    data['delivery_time'] = this.deliveryTime;
    data['latlong'] = this.latlong;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['canceled_reason'] = this.canceledReason;
    data['canceled_reason_admin'] = this.canceledReasonAdmin;
    data['district_code'] = this.districtCode;
    data['district_fee'] = this.districtFee;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    data['approver'] = this.approver;
    data['approver_name'] = this.approverName;
    data['total_price_down'] = this.totalPriceDown;
    data['partner_ship_fee'] = this.partnerShipFee;
    data['partner_revenue_total'] = this.partnerRevenueTotal;
    data['partner_income'] = this.partnerIncome;
    data['shine_revenue_total'] = this.shineRevenueTotal;
    data['shine_income'] = this.shineIncome;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['equal'] = this.equal;
    data['is_shop'] = this.isShop;
    data['distributor_id'] = this.distributorId;
    data['distributor_code'] = this.distributorCode;
    data['distributor_name'] = this.distributorName;
    data['distributor_email'] = this.distributorEmail;
    data['distributor_full_address'] = this.distributorFullAddress;
    data['distributor_phone'] = this.distributorPhone;
    data['distributor_lat'] = this.distributorLat;
    data['distributor_long'] = this.distributorLong;
    data['distributor_postcode'] = this.distributorPostcode;
    data['distributor_status'] = this.distributorStatus;
    // if (this.statusHistories != null) {
    //   data['status_histories'] =
    //       this.statusHistories!.map((v) => v.toJson()).toList();
    // }
    data['delivery_status_histories'] = this.deliveryStatusHistories;
    data['seller_id'] = this.sellerId;
    data['seller_code'] = this.sellerCode;
    data['seller_name'] = this.sellerName;
    data['leader_id'] = this.leaderId;
    data['leader_code'] = this.leaderCode;
    data['leader_name'] = this.leaderName;
    data['status_crm'] = this.statusCrm;
    data['crm_check'] = this.crmCheck;
    data['crm_description'] = this.crmDescription;
    data['description'] = this.description;
    // if (this.freeItem != null) {
    //   data['free_item'] = this.freeItem!.map((v) => v.toJson()).toList();
    // }
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['is_transport'] = this.isTransport;
    data['is_export_order'] = this.isExportOrder;
    data['reference_code'] = this.referenceCode;
    data['estimate_return_from'] = this.estimateReturnFrom;
    data['estimate_return_to'] = this.estimateReturnTo;
    data['commission_total'] = this.commissionTotal;
    data['commission_total_formatted'] = this.commissionTotalFormatted;
    data['commission_hub'] = this.commissionHub;
    data['commission_hub_formatted'] = this.commissionHubFormatted;
    data['percent_commission_hub'] = this.percentCommissionHub;
    data['commission_luukho'] = this.commissionLuukho;
    data['commission_luukho_formatted'] = this.commissionLuukhoFormatted;
    data['percent_commission_luukho'] = this.percentCommissionLuukho;
    data['is_cancel_shipping'] = this.isCancelShipping;
    data['link_view_order'] = this.linkViewOrder;
    data['reject_reason'] = this.rejectReason;
    data['reject_by'] = this.rejectBy;
    data['reject_date'] = this.rejectDate;
    data['status_shipping'] = this.statusShipping;
    data['status_shipping_text'] = this.statusShippingText;

    return data;
  }
}

class Geometry {
  int? latitude;
  int? longitude;

  Geometry({this.latitude, this.longitude});

  Geometry.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Details {
  int? id;
  String? orderId;
  int? productId;
  String? productCode;
  String? productName;
  int? productUnitId;
  String? productUnitCode;
  String? productUnitName;
  String? thumbnail;
  int? productPriceDown;
  int? productDownRate;
  String? productDownFrom;
  String? productDownTo;
  String? cardCode;
  int? quantityGiftCards;
  int? qty;
  String? qtySale;
  String? slug;
  int? shippedQty;
  String? waitingQty;
  int? price;
  String? priceFormatted;
  int? promotionPrice;
  String? promotionPriceFormatted;
  int? priceDown;
  int? realPrice;
  int? total;
  String? totalFormatted;
  String? note;
  int? discount;
  String? discountFormatted;
  String? status;
  String? statusName;
  int? isComment;
  String? commented;
  String? pointInput;
  String? serialNo;
  String? cardName;

  Details(
      {this.id,
      this.orderId,
      this.productId,
      this.productCode,
      this.productName,
      this.productUnitId,
      this.productUnitCode,
      this.productUnitName,
      this.thumbnail,
      this.productPriceDown,
      this.productDownRate,
      this.productDownFrom,
      this.productDownTo,
      this.cardCode,
      this.quantityGiftCards,
      this.qty,
      this.qtySale,
      this.slug,
      this.shippedQty,
      this.waitingQty,
      this.price,
      this.priceFormatted,
      this.promotionPrice,
      this.promotionPriceFormatted,
      this.priceDown,
      this.realPrice,
      this.total,
      this.totalFormatted,
      this.note,
      this.discount,
      this.discountFormatted,
      this.status,
      this.statusName,
      this.isComment,
      this.commented,
      this.pointInput,
      this.serialNo,
      this.cardName});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productCode = json['product_code'];
    productName = json['product_name'];
    productUnitId = json['product_unit_id'];
    productUnitCode = json['product_unit_code'];
    productUnitName = json['product_unit_name'];
    thumbnail = json['thumbnail'];
    productPriceDown = json['product_price_down'];
    productDownRate = json['product_down_rate'];
    productDownFrom = json['product_down_from'];
    productDownTo = json['product_down_to'];
    cardCode = json['card_code'];
    quantityGiftCards = json['quantity_gift_cards'];
    qty = json['qty'];
    qtySale = json['qty_sale'];
    slug = json['slug'];
    shippedQty = json['shipped_qty'];
    waitingQty = json['waiting_qty'];
    price = json['price'];
    priceFormatted = json['price_formatted'];
    promotionPrice = json['promotion_price'];
    promotionPriceFormatted = json['promotion_price_formatted'];
    priceDown = json['price_down'];
    realPrice = json['real_price'];
    total = json['total'];
    totalFormatted = json['total_formatted'];
    note = json['note'];
    discount = json['discount'];
    discountFormatted = json['discount_formatted'];
    status = json['status'];
    statusName = json['status_name'];
    isComment = json['is_comment'];
    commented = json['commented'];
    pointInput = json['point_input'];
    serialNo = json['serial_no'];
    cardName = json['card_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['product_unit_id'] = this.productUnitId;
    data['product_unit_code'] = this.productUnitCode;
    data['product_unit_name'] = this.productUnitName;
    data['thumbnail'] = this.thumbnail;
    data['product_price_down'] = this.productPriceDown;
    data['product_down_rate'] = this.productDownRate;
    data['product_down_from'] = this.productDownFrom;
    data['product_down_to'] = this.productDownTo;
    data['card_code'] = this.cardCode;
    data['quantity_gift_cards'] = this.quantityGiftCards;
    data['qty'] = this.qty;
    data['qty_sale'] = this.qtySale;
    data['slug'] = this.slug;
    data['shipped_qty'] = this.shippedQty;
    data['waiting_qty'] = this.waitingQty;
    data['price'] = this.price;
    data['price_formatted'] = this.priceFormatted;
    data['promotion_price'] = this.promotionPrice;
    data['promotion_price_formatted'] = this.promotionPriceFormatted;
    data['price_down'] = this.priceDown;
    data['real_price'] = this.realPrice;
    data['total'] = this.total;
    data['total_formatted'] = this.totalFormatted;
    data['note'] = this.note;
    data['discount'] = this.discount;
    data['discount_formatted'] = this.discountFormatted;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    data['is_comment'] = this.isComment;
    data['commented'] = this.commented;
    data['point_input'] = this.pointInput;
    data['serial_no'] = this.serialNo;
    data['card_name'] = this.cardName;
    return data;
  }
}

class CardInfo {
  int? quantity;
  String? cardCode;
  String? cardName;

  CardInfo({this.quantity, this.cardCode, this.cardName});

  CardInfo.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    cardCode = json['card_code'];
    cardName = json['card_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['card_code'] = this.cardCode;
    data['card_name'] = this.cardName;
    return data;
  }
}
