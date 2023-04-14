import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/model/image.dart';

part 'image_response.g.dart';

@JsonSerializable()
class ImageResponse {
  int id;
  List<Image> backdrops;
  List<Image> posters;

  ImageResponse(this.id, this.backdrops, this.posters);

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}