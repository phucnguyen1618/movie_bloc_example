import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/model/genre.dart';
import 'package:movie_api/model/movie.dart';

@immutable
class GenreMovieListState extends Equatable {
  final List<Genre> genres;
  final List<Movie> movies;

  const GenreMovieListState({
    required this.movies,
    required this.genres,
  });

  GenreMovieListState copyWith({
    List<Genre>? genreList,
    List<Movie>? movieList,
  }) {
    return GenreMovieListState(
        movies: movieList ?? [], genres: genreList ?? []);
  }

  @override
  List<Object?> get props => [movies, genres];
}
