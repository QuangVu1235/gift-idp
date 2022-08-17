import 'package:json_annotation/json_annotation.dart';
part 'gift_exchange_points_response.g.dart';

@JsonSerializable()
class DataGitExchangePoints {
  @JsonKey(name: 'data')
  List<GitExchangePointsResp>? data;

  DataGitExchangePoints({this.data});
  factory DataGitExchangePoints.fromJson(Map<String, dynamic> json) =>
      _$DataGitExchangePointsFromJson(json);
  Map<String, dynamic> toJson() => _$DataGitExchangePointsToJson(this);
}
@JsonSerializable()
class GitExchangePointsResp {
  int? id;
  String? code;
  String? phone;
  String? email;
  String? type;
  String? address;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'group_id')
  int? groupId;
  @JsonKey(name: 'group_name')
  String? groupName;
  @JsonKey(name: 'group_code')
  String? groupCode;
  @JsonKey(name: 'is_active')
  int? isActive;
  String? tax;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  GitExchangePointsResp(
      {this.id,
        this.code,
        this.phone,
        this.email,
        this.type,
        this.address,
        this.fullName,
        this.groupId,
        this.groupName,
        this.groupCode,
        this.isActive,
        this.tax,
        this.updatedAt});

  GitExchangePointsResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    phone = json['phone'];
    email = json['email'];
    type = json['type'];
    address = json['address'];
    fullName = json['full_name'];
    groupId = json['group_id'];
    groupName = json['group_name'];
    groupCode = json['group_code'];
    isActive = json['is_active'];
    tax = json['tax'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['type'] = this.type;
    data['address'] = this.address;
    data['full_name'] = this.fullName;
    data['group_id'] = this.groupId;
    data['group_name'] = this.groupName;
    data['group_code'] = this.groupCode;
    data['is_active'] = this.isActive;
    data['tax'] = this.tax;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}