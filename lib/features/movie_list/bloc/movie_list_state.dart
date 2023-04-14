import 'package:equatable/equatable.dart';
import 'package:movie_api/model/movie.dart';

class MovieListState extends Equatable {
  final List<Movie>? movieList;

  const MovieListState(this.movieList);

  @override
  List<Object?> get props => [movieList];

}