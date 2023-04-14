import 'package:movie_api/model/cast.dart';
import 'package:movie_api/model/crew.dart';
import 'package:movie_api/model/keyword.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/movie_detail.dart';

class MovieDetailState {
  LoadingMovieDetailStatus loadingStatus;
  MovieDetail? movieDetail;
  List<Keyword> keywords;
  List<Movie>? recommendedList;
  List<Movie>? similarMovieList;
  List<Cast>? casts;
  List<Crew>? crews;

  MovieDetailState({
    required this.loadingStatus,
    this.movieDetail,
    required this.keywords,
    this.recommendedList,
    this.similarMovieList,
    this.casts,
    this.crews,
  });

  MovieDetailState copyWith({
    required LoadingMovieDetailStatus status,
    MovieDetail? detail,
    List<Keyword>? keywords,
    List<Movie>? recommendations,
    List<Movie>? similarMovies,
    List<Cast>? castList,
    List<Crew>? crewList,
  }) {
    return MovieDetailState(
      loadingStatus: status,
      movieDetail: detail,
      keywords: keywords ?? [],
      recommendedList: recommendations ?? [],
      similarMovieList: similarMovies,
      casts: castList,
      crews: crewList,
    );
  }
}

enum LoadingMovieDetailStatus { initial, loading, success, failure }
