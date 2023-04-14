import 'package:equatable/equatable.dart';
import 'package:movie_api/model/review.dart';

class ReviewMovieState extends Equatable {
  final LoadingReviewStatus loadingStatus;
  final List<Review>? reviews;

  const ReviewMovieState({required this.loadingStatus, this.reviews});

  ReviewMovieState copyWith({
    required LoadingReviewStatus status,
    List<Review>? reviewList,
  }) {
    return ReviewMovieState(
      loadingStatus: status,
      reviews: reviewList,
    );
  }

  @override
  List<Object?> get props => [reviews];
}

enum LoadingReviewStatus { loading, success, failure }
