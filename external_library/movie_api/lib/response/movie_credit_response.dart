import 'package:json_annotation/json_annotation.dart';

import '../model/movie_cast.dart';
import '../model/movie_crew.dart';

part 'movie_credit_response.g.dart';

//Tra ve cac bo phim ma person tham gia la dien vien hoac hau ky
@JsonSerializable()
class MovieCreditResponse {
  int id;
  @JsonKey(name: 'cast')
  List<MovieCast> casts;
  @JsonKey(name: 'crew')
  List<MovieCrew> crews;

  MovieCreditResponse(this.id, this.casts, this.crews);

  factory MovieCreditResponse.fromJson(Map<String, dynamic> json) => _$MovieCreditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditResponseToJson(this);
}