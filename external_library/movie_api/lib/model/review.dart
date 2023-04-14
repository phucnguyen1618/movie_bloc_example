import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/model/author_detail.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  String author;
  @JsonKey(name: 'author_details')
  AuthorDetail authorDetail;
  String content;
  @JsonKey(name: 'created_at')
  String createdAt;
  String id;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  String url;

  Review(
    this.author,
    this.authorDetail,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  );

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
