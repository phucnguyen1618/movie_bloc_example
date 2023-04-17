import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/model/genre.dart';
import 'package:movie_api/model/movie.dart';

@immutable
class GenreMovieListState extends Equatable {
  final LoadingMovieStatus loadingStatus;
  final List<Genre> genres;
  final List<Movie> movies;

  const GenreMovieListState({
    this.loadingStatus = LoadingMovieStatus.loading,
    required this.movies,
    required this.genres,
  });

  GenreMovieListState copyWith({
    LoadingMovieStatus? status,
    List<Genre>? genreList,
    List<Movie>? movieList,
  }) {
    return GenreMovieListState(
        loadingStatus: status ?? LoadingMovieStatus.loading,
        movies: movieList ?? [],
        genres: genreList ?? []);
  }

  @override
  List<Object?> get props => [movies, genres];
}

enum LoadingMovieStatus { loading, success, failure }
