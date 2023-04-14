// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      json['backdrop_path'] as String?,
      json['budget'] as int,
      (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int,
      json['original_title'] as String,
      json['overview'] as String,
      (json['popularity'] as num).toDouble(),
      json['poster_path'] as String?,
      json['release_date'] as String,
      json['revenue'] as int,
      json['runtime'] as int?,
      json['status'] as String,
      json['tagline'] as String?,
      json['title'] as String,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
