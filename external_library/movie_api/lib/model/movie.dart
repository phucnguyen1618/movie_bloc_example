import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  bool adult;
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'id')
  int idMovie;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  String title;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  double popularity;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'vote_average')
  double voteAverage;

  Movie(
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.idMovie,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.voteAverage,
  );

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
