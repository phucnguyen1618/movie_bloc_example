// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeywordResponse _$KeywordResponseFromJson(Map<String, dynamic> json) =>
    KeywordResponse(
      json['id'] as int,
      (json['keywords'] as List<dynamic>)
          .map((e) => Keyword.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KeywordResponseToJson(KeywordResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keywords': instance.keywords,
    };
