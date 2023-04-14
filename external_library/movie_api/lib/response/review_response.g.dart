// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    ReviewResponse(
      json['page'] as int,
      json['total_results'] as int,
      json['total_pages'] as int,
      json['id'] as int?,
      (json['results'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'id': instance.id,
      'results': instance.reviews,
    };
