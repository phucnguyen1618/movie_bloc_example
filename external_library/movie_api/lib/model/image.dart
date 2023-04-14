import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  @JsonKey(name: 'aspect_ratio')
  double aspectRatio;
  @JsonKey(name: 'file_path')
  String filePath;
  int height;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  int width;

  Image(
    this.aspectRatio,
    this.filePath,
    this.height,
    this.voteAverage,
    this.voteCount,
    this.width,
  );

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
