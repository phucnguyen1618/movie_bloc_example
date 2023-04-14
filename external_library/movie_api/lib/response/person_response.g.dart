// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonResponse _$PersonResponseFromJson(Map<String, dynamic> json) =>
    PersonResponse(
      json['page'] as int,
      json['total_results'] as int,
      json['total_pages'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonResponseToJson(PersonResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.persons,
    };
