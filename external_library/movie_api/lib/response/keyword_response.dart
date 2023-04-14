import 'package:json_annotation/json_annotation.dart';

import '../model/keyword.dart';

part 'keyword_response.g.dart';

@JsonSerializable()
class KeywordResponse {
  int id;
  List<Keyword> keywords;

  KeywordResponse(this.id, this.keywords);

  factory KeywordResponse.fromJson(Map<String, dynamic> json) => _$KeywordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordResponseToJson(this);
}