import 'package:json_annotation/json_annotation.dart';

import '../model/cast.dart';
import '../model/crew.dart';

part 'credit_response.g.dart';

@JsonSerializable()
class CreditResponse {
  int id;
  @JsonKey(name: 'cast')
  List<Cast> casts;
  @JsonKey(name: 'crew')
  List<Crew> crews;

  CreditResponse(this.id, this.casts, this.crews);

  factory CreditResponse.fromJson(Map<String, dynamic> json) => _$CreditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditResponseToJson(this);
}