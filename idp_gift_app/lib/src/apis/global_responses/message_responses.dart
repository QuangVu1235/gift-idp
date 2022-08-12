import 'package:json_annotation/json_annotation.dart';

part 'message_responses.g.dart';

@JsonSerializable()
class MessageResponses {
  MessageResponses();

  factory MessageResponses.fromJson(Map<String, dynamic> json) =>
      _$MessageResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponsesToJson(this);

  @JsonKey(name: 'message')
  String? message;
}
