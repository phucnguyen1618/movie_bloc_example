// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCrew _$MovieCrewFromJson(Map<String, dynamic> json) => MovieCrew(
      json['id'] as int,
      json['department'] as String,
      json['original_language'] as String,
      json['original_title'] as String,
      json['job'] as String,
      json['overview'] as String,
      json['vote_count'] as int,
      json['video'] as bool,
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
      json['title'] as String,
      (json['popularity'] as num).toDouble(),
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      (json['vote_average'] as num).toDouble(),
      json['adult'] as bool,
      json['release_date'] as String,
      json['credit_id'] as String,
    );

Map<String, dynamic> _$MovieCrewToJson(MovieCrew instance) => <String, dynamic>{
      'id': instance.id,
      'department': instance.department,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'job': instance.job,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'popularity': instance.popularity,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'adult': instance.adult,
      'release_date': instance.releaseDate,
      'credit_id': instance.creditId,
    };
