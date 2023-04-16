import 'package:json_annotation/json_annotation.dart';

part 'movie_cast.g.dart';

@JsonSerializable()
class MovieCast {
  String character;
  @JsonKey(name: 'credit_id')
  String creditId;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'vote_count')
  int voteCount;
  bool video;
  bool adult;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  String title;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  double popularity;
  int id;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  MovieCast(
    this.character,
    this.creditId,
    this.releaseDate,
    this.voteCount,
    this.video,
    this.adult,
    this.voteAverage,
    this.title,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.id,
    this.backdropPath,
    this.overview,
    this.posterPath,
  );

  factory MovieCast.fromJson(Map<String, dynamic> json) => _$MovieCastFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCastToJson(this);
}
