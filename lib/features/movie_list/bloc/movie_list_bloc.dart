import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_state.dart';

class MovieListBloc extends BlocBase<MovieListState> {
  int page = 1;
  List<Movie>? movies;
  final movieRepository = Get.find<MovieDataRepository>();

  MovieListBloc(
    MovieType movieType, {
    String? nameGenre,
    int? movieID,
  }) : super(const MovieListState(
          status: LoadingMovieListStatus.loading,
          movieList: [],
        )) {
    getMovieList(type: movieType, id: movieID, genre: nameGenre);
  }

  Future<void> onViewMore() async {
    try {
      emit(state.copyWith(
        loadingMovieListStatus: LoadingMovieListStatus.loading,
        movies: movies,
      ));
      page++;
      List<Movie>? result = await _fetchNowPlayingMovieList(page: page);
      if (result != null) {
        movies!.addAll(result);
      }
      emit(state.copyWith(
          loadingMovieListStatus: LoadingMovieListStatus.success,
          movies: movies));
    } catch (error) {
      emit(state.copyWith(
          loadingMovieListStatus: LoadingMovieListStatus.failure));
    }
  }

  Future<void> getMovieList(
      {required MovieType type, int? id, String? genre}) async {
    switch (type) {
      case MovieType.recommendations:
        movies = await _fetchRecommendationsMovieList(movieId: id!);
        break;
      case MovieType.genre:
        movies = await _fetchMovieListByGenre(genreName: genre!);
        break;
      case MovieType.popular:
        movies = await _fetchPopularMovieList(page: page);
        break;
      case MovieType.topRated:
        movies = await _fetchTopRatedMovieList(page: page);
        break;
      case MovieType.nowPlaying:
        movies = await _fetchNowPlayingMovieList(page: page);
        break;
      case MovieType.upComing:
        movies = await _fetchUpcomingMovieList(page: page);
        break;
      case MovieType.similarMovies:
        movies = await _fetchSimilarMovieList(movieId: id!, page: page);
        break;
    }
    emit(state.copyWith(
        loadingMovieListStatus: LoadingMovieListStatus.success,
        movies: movies));
  }

  Future<List<Movie>?> _fetchRecommendationsMovieList(
      {required int movieId, int? page}) async {
    try {
      final movieResponse = await movieRepository.recommendations(
          movieId, AppConstants.apiKey, page);
      return movieResponse.movies;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<List<Movie>?> _fetchPopularMovieList({int? page}) async {
    try {
      final movieResponse =
          await movieRepository.popularMovies(AppConstants.apiKey, page);
      return movieResponse.movies;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<List<Movie>?> _fetchNowPlayingMovieList({int? page}) async {
    try {
      final movieResponse =
          await movieRepository.nowPlaying(AppConstants.apiKey, page);
      return movieResponse.movies;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<List<Movie>?> _fetchUpcomingMovieList({int? page}) async {
    try {
      final movieResponse =
          await movieRepository.upcoming(AppConstants.apiKey, page);
      return movieResponse.results;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<List<Movie>?> _fetchTopRatedMovieList({int? page}) async {
    try {
      final movieResponse =
          await movieRepository.topRatedMovies(AppConstants.apiKey, page);
      return movieResponse.movies;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<List<Movie>?> _fetchSimilarMovieList(
      {required int movieId, int? page}) async {
    try {
      final movieResponse = await movieRepository.similarMovies(
          movieId, AppConstants.apiKey, page);
      return movieResponse.movies;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<List<Movie>?> _fetchMovieListByGenre(
      {required String genreName, int? page}) async {
    try {
      final movieResponse = await movieRepository.discoverMovie(
          AppConstants.apiKey, page, genreName);
      return movieResponse.movies;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }
}

enum MovieType {
  genre,
  popular,
  topRated,
  nowPlaying,
  upComing,
  recommendations,
  similarMovies,
}
