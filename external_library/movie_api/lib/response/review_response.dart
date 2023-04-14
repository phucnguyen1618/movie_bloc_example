import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/response/base_response.dart';

import '../model/review.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse extends BaseResponse {

  int? id;
  @JsonKey(name: 'results')
  List<Review> reviews;

  ReviewResponse(
    super.page,
    super.totalResults,
    super.totalPages,
    this.id,
    this.reviews,
  );

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => _$ReviewResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}
