class StatusOrderResp{
  String? status;
  DataStatusOrderResp? data;

  StatusOrderResp({this.status, this.data});

  StatusOrderResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new DataStatusOrderResp.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataStatusOrderResp {
  int? orderId;
  String? orderCode;
  String? paymentMethod;
  int? lat;
  int? long;
  int? total;

  DataStatusOrderResp(
      {this.orderId,
        this.orderCode,
        this.paymentMethod,
        this.lat,
        this.long,
        this.total});

  DataStatusOrderResp.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderCode = json['order_code'];
    paymentMethod = json['payment_method'];
    lat = json['lat'];
    long = json['long'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_code'] = this.orderCode;
    data['payment_method'] = this.paymentMethod;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['total'] = this.total;
    return data;
  }
}