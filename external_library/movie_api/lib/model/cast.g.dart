// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      json['gender'] as int?,
      json['id'] as int,
      json['known_for_department'] as String,
      json['name'] as String,
      json['original_name'] as String,
      (json['popularity'] as num).toDouble(),
      json['profile_path'] as String?,
      json['cast_id'] as int,
      json['character'] as String,
      json['credit_id'] as String,
      json['order'] as int,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castID,
      'character': instance.character,
      'credit_id': instance.creditID,
      'order': instance.order,
    };
