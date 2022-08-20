class ConfirmOrderRequest {
  String? sessionId;
  String? phone;
  String? cityCode;
  String? districtCode;
  String? wardCode;
  String? streetAddress;
  String? fullName;
  String? orderChannel;
  int? distributorId;
  String? distributorCode;
  String? distributorName;

  ConfirmOrderRequest(
      {this.sessionId,
        this.phone,
        this.cityCode,
        this.districtCode,
        this.wardCode,
        this.streetAddress,
        this.fullName,
        this.orderChannel,
        this.distributorId,
        this.distributorCode,
        this.distributorName});

  ConfirmOrderRequest.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    phone = json['phone'];
    cityCode = json['city_code'];
    districtCode = json['district_code'];
    wardCode = json['ward_code'];
    streetAddress = json['street_address'];
    fullName = json['full_name'];
    orderChannel = json['order_channel'];
    distributorId = json['distributor_id'];
    distributorCode = json['distributor_code'];
    distributorName = json['distributor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['phone'] = this.phone;
    data['city_code'] = this.cityCode;
    data['district_code'] = this.districtCode;
    data['ward_code'] = this.wardCode;
    data['street_address'] = this.streetAddress;
    data['full_name'] = this.fullName;
    data['order_channel'] = this.orderChannel;
    data['distributor_id'] = this.distributorId;
    data['distributor_code'] = this.distributorCode;
    data['distributor_name'] = this.distributorName;
    return data;
  }
}