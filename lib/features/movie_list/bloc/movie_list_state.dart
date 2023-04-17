import 'package:equatable/equatable.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_bloc.dart';

class MovieListState extends Equatable {
  final LoadingMovieListStatus status;
  final List<Movie>? movieList;
  final bool isHaveLoadMore;
  final MovieType movieType;

  const MovieListState({
    this.status = LoadingMovieListStatus.initial,
    this.movieList,
    this.isHaveLoadMore = true,
    required this.movieType,
  });

  MovieListState copyWith({
    LoadingMovieListStatus? loadingMovieListStatus,
    List<Movie>? movies,
    bool? isHaveLoadMore,
    MovieType? movieType,
  }) {
    return MovieListState(
      status: loadingMovieListStatus ?? status,
      movieList: movies ?? movieList,
      isHaveLoadMore: isHaveLoadMore ?? this.isHaveLoadMore,
      movieType: movieType ?? this.movieType,
    );
  }

  @override
  List<Object?> get props => [status, movieList, isHaveLoadMore, movieType];
}

enum LoadingMovieListStatus { initial, success, failure }
