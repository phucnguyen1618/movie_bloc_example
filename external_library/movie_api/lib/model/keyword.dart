import 'package:json_annotation/json_annotation.dart';

part 'keyword.g.dart';

@JsonSerializable()
class Keyword {
  int id;
  String name;

  Keyword(this.id, this.name);

  factory Keyword.fromJson(Map<String, dynamic> json) => _$KeywordFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordToJson(this);
}