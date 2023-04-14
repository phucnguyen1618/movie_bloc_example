import 'package:json_annotation/json_annotation.dart';

part 'author_detail.g.dart';

@JsonSerializable()
class AuthorDetail {
  String name;
  String username;
  @JsonKey(name: 'avatar_path')
  String? avatarPath;
  double? rating;

  AuthorDetail(this.name, this.username, this.avatarPath, this.rating);

  factory AuthorDetail.fromJson(Map<String, dynamic> json) => _$AuthorDetailFromJson(json);

  Map<String,dynamic> toJson() => _$AuthorDetailToJson(this);
}