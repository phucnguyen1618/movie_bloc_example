import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/response/base_response.dart';

import '../model/person.dart';

part 'person_response.g.dart';

@JsonSerializable()
class PersonResponse extends BaseResponse {
  @JsonKey(name: 'results')
  List<Person> persons;

  PersonResponse(
    super.page,
    super.totalResults,
    super.totalPages,
    this.persons,
  );

  factory PersonResponse.fromJson(Map<String, dynamic> json) => _$PersonResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}
