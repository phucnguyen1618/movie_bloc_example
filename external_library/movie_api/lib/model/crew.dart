import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
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
  @JsonKey(name: 'credit_id')
  String creditID;
  String department;
  String job;

  Crew(
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditID,
    this.department,
    this.job,
  );

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
