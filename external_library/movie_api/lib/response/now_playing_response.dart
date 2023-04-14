import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/response/base_response.dart';

import '../model/date.dart';
import '../model/movie.dart';

part 'now_playing_response.g.dart';

@JsonSerializable()
class NowPlayingResponse extends BaseResponse {
  @JsonKey(name: 'results')
  List<Movie> movies = [];
  @JsonKey(name: 'dates')
  Date date;

  NowPlayingResponse(
    super.page,
    super.totalResults,
    super.totalPages,
    this.movies,
    this.date,
  );

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) => _$NowPlayingResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NowPlayingResponseToJson(this);
}
