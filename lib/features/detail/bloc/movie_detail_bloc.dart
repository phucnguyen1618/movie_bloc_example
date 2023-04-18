import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/cast.dart';
import 'package:movie_api/model/crew.dart';
import 'package:movie_api/model/keyword.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/movie_detail.dart';
import 'package:movie_api/model/review.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_api/response/video_response.dart';

import '../../../shared/utils/bottomshet_utils.dart';
import '../../../shared/widgets/view_all_review.dart';
import 'movie_detail_state.dart';
import 'package:movie_api/model/image.dart' as image;

class MovieDetailBloc extends BlocBase<MovieDetailState> {
  final movieRepository = Get.find<MovieDataRepository>();
  MovieDetail? movieDetail;
  List<Keyword>? keywordList;
  List<Movie>? recommendations;
  List<Movie>? similarMovies;
  List<Cast>? castList;
  List<Crew>? crewList;
  List<Review>? reviewList;
  List<image.Image>? moviePosters;
  List<image.Image>? movieBackdrops;
  List<Results>? videos;

  MovieDetailBloc(int id)
      : super(const MovieDetailState(
          loadingStatus: LoadingMovieDetailStatus.initial,
          keywords: [],
          recommendedList: [],
          similarMovieList: [],
          reviews: [],
        )) {
    fetchMovieDetail(id);
  }

  void onViewAllMovieReview(BuildContext context) {
    BottomSheetUtils.showGeneralBottomSheet(
        context, ViewAllReview(reviews: reviewList ?? []));
  }

  void onItemRecommendationMovieListClicked(int movieId) {
    emit(state.copyWith(status: LoadingMovieDetailStatus.loading));
    reviewList!.clear();
    if (recommendations != null) {
      recommendations!.clear();
    }
    keywordList!.clear();
    fetchMovieDetail(movieId);
  }

  void onItemSimilarMovieListClicked(int movieId) {
    emit(state.copyWith(status: LoadingMovieDetailStatus.loading));
    reviewList!.clear();
    if (recommendations != null) {
      recommendations!.clear();
    }
    keywordList!.clear();
    fetchMovieDetail(movieId);
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
      final reviewResponse =
          await movieRepository.reviews(id, AppConstants.apiKey, 1);
      if (reviewResponse.reviews.isNotEmpty) {
        reviewList = reviewResponse.reviews;
      }
      final imageResponse =
          await movieRepository.images(AppConstants.apiKey, id);
      if (imageResponse.posters.isNotEmpty) {
        moviePosters = imageResponse.posters;
      }
      if (imageResponse.backdrops.isNotEmpty) {
        movieBackdrops = imageResponse.backdrops;
      }
      final videoResponse =
          await movieRepository.videos(AppConstants.apiKey, id);
      if (videoResponse.results != null) {
        videos = videoResponse.results!;
      }
      emit(state.copyWith(
        status: LoadingMovieDetailStatus.success,
        detail: movieDetail,
        keywords: keywordList,
        recommendations: recommendations,
        similarMovies: similarMovies,
        castList: castList,
        crewList: crewList,
        reviewList: reviewList,
        moviePosters: moviePosters,
        movieBackdrops: movieBackdrops,
        videos: videos,
      ));
    } catch (error) {
      emit(state.copyWith(status: LoadingMovieDetailStatus.failure));
    }
  }
}
