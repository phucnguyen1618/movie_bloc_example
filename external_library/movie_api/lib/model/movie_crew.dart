import 'package:json_annotation/json_annotation.dart';

part 'movie_crew.g.dart';

@JsonSerializable()
class MovieCrew {
  int id;
  String department;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String job;
  String overview;
  @JsonKey(name: 'vote_count')
  int voteCount;
  bool video;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String title;
  double popularity;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  bool adult;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'credit_id')
  String creditId;

  MovieCrew(
    this.id,
    this.department,
    this.originalLanguage,
    this.originalTitle,
    this.job,
    this.overview,
    this.voteCount,
    this.video,
    this.posterPath,
    this.backdropPath,
    this.title,
    this.popularity,
    this.genreIds,
    this.voteAverage,
    this.adult,
    this.releaseDate,
    this.creditId,
  );

  factory MovieCrew.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCrewToJson(this);
}
