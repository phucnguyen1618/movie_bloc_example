import 'package:equatable/equatable.dart';
import 'package:movie_api/model/movie.dart';

class MovieListState extends Equatable {
  final LoadingMovieListStatus status;
  final List<Movie>? movieList;

  const MovieListState({
    required this.status,
    this.movieList,
  });

  MovieListState copyWith({
    required final LoadingMovieListStatus loadingMovieListStatus,
    final List<Movie>? movies,
  }) {
    return MovieListState(
      status: loadingMovieListStatus,
      movieList: movies,
    );
  }

  @override
  List<Object?> get props => [status, movieList];
}

enum LoadingMovieListStatus { loading, success, failure }
