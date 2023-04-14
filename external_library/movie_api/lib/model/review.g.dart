// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      json['author'] as String,
      AuthorDetail.fromJson(json['author_details'] as Map<String, dynamic>),
      json['content'] as String,
      json['created_at'] as String,
      json['id'] as String,
      json['updated_at'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'author': instance.author,
      'author_details': instance.authorDetail,
      'content': instance.content,
      'created_at': instance.createdAt,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
    };
