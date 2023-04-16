import 'package:equatable/equatable.dart';
import 'package:movie_api/model/movie_cast.dart';
import 'package:movie_api/model/person_detail.dart';

class PersonState extends Equatable {
  final PersonDetail? personDetail;
  final List<MovieCast>? movieCasts;

  const PersonState({
    this.personDetail,
    this.movieCasts,
  });

  PersonState copyWith({
    PersonDetail? detail,
    List<MovieCast>? movieCastList,
  }) {
    return PersonState(personDetail: detail, movieCasts: movieCastList);
  }

  @override
  List<Object?> get props => [personDetail, movieCasts];
}
