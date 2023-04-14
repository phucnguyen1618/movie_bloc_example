// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingResponse _$UpcomingResponseFromJson(Map<String, dynamic> json) =>
    UpcomingResponse(
      json['page'] as int,
      json['total_results'] as int,
      json['total_pages'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      Date.fromJson(json['dates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpcomingResponseToJson(UpcomingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
      'dates': instance.date,
    };
