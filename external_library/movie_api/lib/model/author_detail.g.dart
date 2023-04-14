// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetail _$AuthorDetailFromJson(Map<String, dynamic> json) => AuthorDetail(
      json['name'] as String,
      json['username'] as String,
      json['avatar_path'] as String?,
      (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AuthorDetailToJson(AuthorDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
