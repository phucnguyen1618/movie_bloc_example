import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  int budget;
  List<Genre> genres;
  int id;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  int revenue;
  int? runtime;
  String status;
  String? tagline;
  String title;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;

  MovieDetail(
    this.backdropPath,
    this.budget,
    this.genres,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  );

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}
