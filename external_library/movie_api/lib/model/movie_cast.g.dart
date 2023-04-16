// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCast _$MovieCastFromJson(Map<String, dynamic> json) => MovieCast(
      json['character'] as String,
      json['credit_id'] as String,
      json['release_date'] as String,
      json['vote_count'] as int,
      json['video'] as bool,
      json['adult'] as bool,
      (json['vote_average'] as num).toDouble(),
      json['title'] as String,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['original_language'] as String,
      json['original_title'] as String,
      (json['popularity'] as num).toDouble(),
      json['id'] as int,
      json['backdrop_path'] as String?,
      json['overview'] as String,
      json['poster_path'] as String?,
    );

Map<String, dynamic> _$MovieCastToJson(MovieCast instance) => <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.creditId,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'adult': instance.adult,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'popularity': instance.popularity,
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
