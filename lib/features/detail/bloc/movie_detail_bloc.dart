import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/cast.dart';
import 'package:movie_api/model/crew.dart';
import 'package:movie_api/model/keyword.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/movie_detail.dart';
import 'package:movie_api/repository/movie_repository.dart';

import 'movie_detail_state.dart';

class MovieDetailBloc extends BlocBase<MovieDetailState> {
  final movieRepository = Get.find<MovieDataRepository>();
  MovieDetail? movieDetail;
  List<Keyword>? keywordList;
  List<Movie>? recommendations;
  List<Movie>? similarMovies;
  List<Cast>? castList;
  List<Crew>? crewList;

  MovieDetailBloc(int id)
      : super(MovieDetailState(
          loadingStatus: LoadingMovieDetailStatus.initial,
          keywords: [],
          recommendedList: [],
          similarMovieList: [],
        )) {
    fetchMovieDetail(id);
  }

  Future<void> fetchMovieDetail(int id) async {
    try {
      final response =
          await movieRepository.movieDetail(AppConstants.apiKey, id);
      movieDetail = response;
      final keywordResponse =
          await movieRepository.keywords(AppConstants.apiKey, id);
      if (keywordResponse.keywords.isNotEmpty) {
        keywordList = keywordResponse.keywords;
      }
      final recommendationResponse =
          await movieRepository.recommendations(id, AppConstants.apiKey, 1);
      if (recommendationResponse.movies.isNotEmpty) {
        recommendations = recommendationResponse.movies;
      }
      final similarResponse =
          await movieRepository.similarMovies(id, AppConstants.apiKey, 1);
      if (similarResponse.movies.isNotEmpty) {
        similarMovies = similarResponse.movies;
      }
      final creditResponse =
          await movieRepository.credits(AppConstants.apiKey, id);
      if (creditResponse.casts.isNotEmpty) {
        castList = creditResponse.casts;
      }
      if (creditResponse.crews.isNotEmpty) {
        crewList = creditResponse.crews;
      }
      emit(state.copyWith(
        status: LoadingMovieDetailStatus.success,
        detail: movieDetail,
        keywords: keywordList,
        recommendations: recommendations,
        similarMovies: similarMovies,
        castList: castList,
        crewList: crewList,
      ));
    } catch (error) {
      emit(state.copyWith(status: LoadingMovieDetailStatus.failure));
    }
  }
}
