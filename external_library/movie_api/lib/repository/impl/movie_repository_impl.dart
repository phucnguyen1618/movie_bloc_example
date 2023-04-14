import 'package:movie_api/datasource/movie_data_api.dart';
import 'package:movie_api/model/movie_detail.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_api/response/credit_response.dart';
import 'package:movie_api/response/genre_response.dart';
import 'package:movie_api/response/image_response.dart';
import 'package:movie_api/response/keyword_response.dart';
import 'package:movie_api/response/movie_list_response.dart';
import 'package:movie_api/response/now_playing_response.dart';
import 'package:movie_api/response/person_response.dart';
import 'package:movie_api/response/review_response.dart';
import 'package:movie_api/response/upcoming_response.dart';
import 'package:movie_api/response/video_response.dart';

class MovieDataRepositoryImpl extends MovieDataRepository {
  final MovieDataAPI _api;

  MovieDataRepositoryImpl(this._api);

  @override
  Future<MovieListResponse> popularMovies(String apiKey, int? page) {
    return _api.getPopularMovies(apiKey, page);
  }

  @override
  Future<MovieListResponse> recommendations(int id, String apiKey, int? page) {
    return _api.getRecommendations(id, apiKey, page);
  }

  @override
  Future<ReviewResponse> reviews(int id, String apiKey, int? page) {
    return _api.getReviews(id, apiKey, 'en-US', page);
  }

  @override
  Future<MovieListResponse> similarMovies(int id, String apiKey, int? page) {
    return _api.getSimilarMovies(id, apiKey, page);
  }

  @override
  Future<MovieListResponse> topRatedMovies(String apiKey, int? page) {
    return _api.getTopRatedMovies(apiKey, page);
  }

  @override
  Future<MovieListResponse> trendingMovies(
      String mediaType, String timeWindow, String apiKey) {
    return _api.getTrendingMovies(mediaType, timeWindow, apiKey);
  }

  @override
  Future<UpcomingResponse> upcoming(String apiKey, int? page) {
    return _api.getUpcoming(apiKey, page);
  }

  @override
  Future<NowPlayingResponse> nowPlaying(String apiKey, int? page) {
    return _api.getNowPlaying(apiKey, page);
  }

  @override
  Future<MovieListResponse> discoverMovie(
      String apiKey, int? page, String genres) {
    return _api.getMovieDiscover(apiKey, page, genres);
  }

  @override
  Future<GenreResponse> genreList(String apiKey) {
    return _api.getGenres(apiKey);
  }

  @override
  Future<MovieDetail> movieDetail(String apiKey, int movieId) {
    return _api.movieDetail(apiKey, movieId);
  }

  @override
  Future<KeywordResponse> keywords(String apiKey, int movieID) {
    return _api.getKeyword(apiKey, movieID);
  }

  @override
  Future<CreditResponse> credits(String apiKey, int movieID) {
    return _api.getCredits(apiKey, movieID);
  }

  @override
  Future<ImageResponse> images(String apiKey, int movieId) {
    return _api.getImages(apiKey, movieId);
  }

  @override
  Future<VideoResponse> videos(String apiKey, int movieId) {
    return _api.getVideos(apiKey, movieId);
  }

  @override
  Future<PersonResponse> trendingPersonForWeek(String apiKey) {
    return _api.getTrendingPersonForWeek(apiKey);
  }
}
