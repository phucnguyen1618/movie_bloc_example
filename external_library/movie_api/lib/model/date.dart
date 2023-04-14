import 'package:json_annotation/json_annotation.dart';

part 'date.g.dart';

@JsonSerializable()
class Date {
  String? maximum;
  String? minimum;

  Date(this.maximum, this.minimum);

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}
