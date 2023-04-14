import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/model/date.dart';
import 'package:movie_api/response/base_response.dart';

import '../model/movie.dart';

part 'upcoming_response.g.dart';

@JsonSerializable()
class UpcomingResponse extends BaseResponse {

  List<Movie> results = [];
  @JsonKey(name: 'dates')
  Date date;

  UpcomingResponse(
    super.page,
    super.totalResults,
    super.totalPages,
    this.results,
    this.date,
  );

  factory UpcomingResponse.fromJson(Map<String, dynamic> json) => _$UpcomingResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UpcomingResponseToJson(this);

}
