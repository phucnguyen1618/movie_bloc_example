import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_app/features/movie_list/bloc/movie_event.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieFetched, MovieListState> {
  int page = 1;
  List<Movie>? movies;
  final movieRepository = Get.find<MovieDataRepository>();

  MovieListBloc(
    MovieType movieType, {
    String? nameGenre,
    int? movieID,
  }) : super(MovieListState(movieType: movieType)) {
    on<MovieFetched>(_onMovieFetched);
  }

  Future<void> _onMovieFetched(
      MovieFetched event, Emitter<MovieListState> emit) async {
    if (!state.isHaveLoadMore) return;
    try {
      if (state.status == LoadingMovieListStatus.initial) {
        final movies =
            await getMovieList(type: event.movieType ?? state.movieType);
        return emit(state.copyWith(
          loadingMovieListStatus: LoadingMovieListStatus.success,
          movies: movies,
          isHaveLoadMore: true,
          movieType: event.movieType,
        ));
      }
      page++;
      final movies = await getMovieList(type: state.movieType);
      emit(movies == null
          ? state.copyWith(isHaveLoadMore: false)
          : state.copyWith(
              loadingMovieListStatus: LoadingMovieListStatus.success,
              movies: List.of(state.movieList!)..addAll(movies),
              isHaveLoadMore: true,
              movieType: state.movieType,
            ));
    } catch (_) {
      emit(state.copyWith(
          loadingMovieListStatus: LoadingMovieListStatus.failure));
    }
  }

  Future<List<Movie>?> getMovieList(
      {required MovieType type, int? id, String? genre}) async {
    switch (type) {
      case MovieType.recommendations:
        return _fetchRecommendationsMovieList(movieId: id!);
      case MovieType.genre:
        return _fetchMovieListByGenre(genreName: genre!);
      case MovieType.popular:
        return _fetchPopularMovieList(page: page);
      case MovieType.topRated:
        return _fetchTopRatedMovieList(page: page);
      case MovieType.nowPlaying:
        return _fetchNowPlayingMovieList(page: page);
      case MovieType.upComing:
        return _fetchUpcomingMovieList(page: page);
      case MovieType.similarMovies:
        return _fetchSimilarMovieList(movieId: id!, page: page);
    }
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
