// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCreditResponse _$MovieCreditResponseFromJson(Map<String, dynamic> json) =>
    MovieCreditResponse(
      json['id'] as int,
      (json['cast'] as List<dynamic>)
          .map((e) => MovieCast.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCreditResponseToJson(
        MovieCreditResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.casts,
      'crew': instance.crews,
    };
