import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  int? gender;
  int id;
  @JsonKey(name: 'known_for_department')
  String knownForDepartment;
  String name;
  @JsonKey(name: 'original_name')
  String originalName;
  double popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'cast_id')
  int castID;
  String character;
  @JsonKey(name: 'credit_id')
  String creditID;
  int order;

  Cast(
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castID,
    this.character,
    this.creditID,
    this.order,
  );

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
