import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/response/base_response.dart';

import '../model/movie.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse extends BaseResponse {
  @JsonKey(name: 'results')
  List<Movie> movies;

  MovieListResponse(
    super.page,
    this.movies,
    super.totalResults,
    super.totalPages,
  );

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
