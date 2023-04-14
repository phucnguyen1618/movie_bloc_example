import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/genre.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/repository/movie_repository.dart';

import 'genre_movie_list_state.dart';

class GenreMovieListBloc extends BlocBase<GenreMovieListState> {
  final movieRepository = Get.find<MovieDataRepository>();
  var genreList = <Genre>[];
  var discoverList = <Movie>[];

  GenreMovieListBloc()
      : super(const GenreMovieListState(movies: [], genres: [])) {
    fetchMovieListByGenre();
  }

  void onTabGenreClicked(int index) {
    emit(state.copyWith(
      genreList: genreList,
      movieList: [],
    ));
    log('Genre: ${genreList[index].name}');
    fetchDiscoverMovieList(genre: genreList[index].name);
  }

  Future<void> fetchMovieListByGenre() async {
    try {
      final genreResponse =
          await movieRepository.genreList(AppConstants.apiKey);
      if (genreResponse.genres.isNotEmpty) {
        genreList = genreResponse.genres;
      }
      final response =
          await movieRepository.discoverMovie(AppConstants.apiKey, 1, 'Action');
      if (response.movies.isNotEmpty) {
        discoverList = response.movies;
      }
      emit(state.copyWith(
        genreList: genreList,
        movieList: discoverList,
      ));
    } catch (error) {
      emit(state.copyWith(
        genreList: [],
        movieList: [],
      ));
    }
  }

  Future<void> fetchDiscoverMovieList({String? genre}) async {
    try {
      final response = await movieRepository.discoverMovie(
          AppConstants.apiKey, 1, genre ?? 'Action');
      if (response.movies.isNotEmpty) {
        discoverList = response.movies;
        emit(state.copyWith(
          genreList: genreList,
          movieList: discoverList,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        genreList: genreList,
        movieList: [],
      ));
    }
  }
}
