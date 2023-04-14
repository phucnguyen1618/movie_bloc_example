// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      (json['aspect_ratio'] as num).toDouble(),
      json['file_path'] as String,
      json['height'] as int,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
      json['width'] as int,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
