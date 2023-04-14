import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/review.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_app/features/detail/bloc/review_movie_state.dart';
import 'package:movie_app/shared/utils/bottomshet_utils.dart';
import 'package:movie_app/shared/widgets/view_all_review.dart';

class ReviewMovieBloc extends BlocBase<ReviewMovieState> {
  final movieRepository = Get.find<MovieDataRepository>();
  List<Review>? reviewList;

  ReviewMovieBloc(int movieId)
      : super(const ReviewMovieState(
          loadingStatus: LoadingReviewStatus.loading,
          reviews: [],
        )) {
    fetchMovieReviews(movieId);
  }

  Future<void> fetchMovieReviews(int id) async {
    try {
      final reviewResponse =
          await movieRepository.reviews(id, AppConstants.apiKey, 1);
      if (reviewResponse.reviews.isNotEmpty) {
        reviewList = reviewResponse.reviews;
        emit(state.copyWith(
          status: LoadingReviewStatus.success,
          reviewList: reviewList,
        ));
      }
    } catch (error) {
      log('Error: ${error.toString()}');
      emit(state.copyWith(status: LoadingReviewStatus.failure));
    }
  }

  void onViewAllMovieReview(BuildContext context) {
    BottomSheetUtils.showGeneralBottomSheet(
        context, ViewAllReview(reviews: reviewList ?? []));
  }
}
