// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      json['id'] as int,
      (json['backdrops'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['posters'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrops': instance.backdrops,
      'posters': instance.posters,
    };
