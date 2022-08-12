import 'package:json_annotation/json_annotation.dart';

part 'list_user_phone_responses.g.dart';

@JsonSerializable()
class ListUserPhoneResponses {
  @JsonKey(name: 'data')
  List<DataListUserPhoneResponses>? data;

  ListUserPhoneResponses({
    this.data,
  });

  factory ListUserPhoneResponses.fromJson(Map<String, dynamic> json) => _$ListUserPhoneResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserPhoneResponsesToJson(this);

}

@JsonSerializable()
class DataListUserPhoneResponses {
  @JsonKey(name: 'id')
  dynamic id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'group_code')
  String? groupCode;

  DataListUserPhoneResponses({
    this.id,
    this.name,
    this.phone,
    this.code,
    this.groupCode,
  });

  factory DataListUserPhoneResponses.fromJson(Map<String, dynamic> json) => _$DataListUserPhoneResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$DataListUserPhoneResponsesToJson(this);

}
