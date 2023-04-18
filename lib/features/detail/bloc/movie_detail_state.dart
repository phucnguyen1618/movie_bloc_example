import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/model/cast.dart';
import 'package:movie_api/model/crew.dart';
import 'package:movie_api/model/keyword.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/movie_detail.dart';
import 'package:movie_api/model/review.dart';
import 'package:movie_api/response/video_response.dart';
import 'package:movie_api/model/image.dart' as image;

@immutable
class MovieDetailState extends Equatable {
  final LoadingMovieDetailStatus loadingStatus;
  final MovieDetail? movieDetail;
  final List<Keyword> keywords;
  final List<Movie>? recommendedList;
  final List<Movie>? similarMovieList;
  final List<Cast>? casts;
  final List<Crew>? crews;
  final List<Review>? reviews;
  final List<image.Image>? moviePosters;
  final List<image.Image>? movieBackdrops;
  final List<Results>? videos;

  const MovieDetailState({
    required this.loadingStatus,
    this.movieDetail,
    required this.keywords,
    this.recommendedList,
    this.similarMovieList,
    this.casts,
    this.crews,
    this.reviews,
    this.moviePosters,
    this.movieBackdrops,
    this.videos,
  });

  MovieDetailState copyWith({
    required LoadingMovieDetailStatus status,
    MovieDetail? detail,
    List<Keyword>? keywords,
    List<Movie>? recommendations,
    List<Movie>? similarMovies,
    List<Cast>? castList,
    List<Crew>? crewList,
    List<Review>? reviewList,
    List<image.Image>? moviePosters,
    List<image.Image>? movieBackdrops,
    List<Results>? videos,
  }) {
    return MovieDetailState(
      loadingStatus: status,
      movieDetail: detail,
      keywords: keywords ?? [],
      recommendedList: recommendations ?? [],
      similarMovieList: similarMovies,
      casts: castList,
      crews: crewList,
      reviews: reviewList ?? [],
      moviePosters: moviePosters,
      movieBackdrops: movieBackdrops,
      videos: videos,
    );
  }

  @override
  List<Object?> get props => [
        reviews,
        crews,
        casts,
        similarMovieList,
        recommendedList,
        keywords,
        movieDetail,
        loadingStatus,
        moviePosters,
        movieBackdrops,
        videos,
      ];
}

enum LoadingMovieDetailStatus { initial, loading, success, failure }
