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
      : super(const GenreMovieListState(
          movies: [],
          genres: [],
          loadingStatus: LoadingMovieStatus.loading,
        )) {
    fetchMovieListByGenre(genre: 28.toString());
  }

  void onTabGenreClicked(int index) {
    emit(state.copyWith(
      genreList: genreList,
      movieList: [],
      status: LoadingMovieStatus.loading,
    ));
    log('Genre: ${genreList[index].name} ${genreList[index].id}');
    fetchMovieListByGenre(genre: genreList[index].id.toString());
  }

  Future<void> fetchMovieListByGenre({required String genre}) async {
    try {
      final genreResponse =
      await movieRepository.genreList(AppConstants.apiKey);
      if (genreResponse.genres.isNotEmpty) {
        genreList = genreResponse.genres;
      }
      final response = await movieRepository.discoverMovie(
          AppConstants.apiKey, 1, genre);
      if (response.movies.isNotEmpty) {
        discoverList = response.movies;
        emit(state.copyWith(
          status: LoadingMovieStatus.success,
          genreList: genreList,
          movieList: discoverList,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: LoadingMovieStatus.failure,
        genreList: genreList,
        movieList: [],
      ));
    }
  }
}
