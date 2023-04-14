import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;

  BaseResponse(this.page, this.totalResults, this.totalPages);

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}