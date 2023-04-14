import 'package:movie_api/response/genre_response.dart';
import 'package:movie_api/response/keyword_response.dart';
import 'package:movie_api/response/now_playing_response.dart';

import '../model/movie_detail.dart';
import '../response/credit_response.dart';
import '../response/image_response.dart';
import '../response/movie_list_response.dart';
import '../response/person_response.dart';
import '../response/review_response.dart';
import '../response/upcoming_response.dart';
import '../response/video_response.dart';

abstract class MovieDataRepository {
  Future<MovieListResponse> popularMovies(String apiKey, int? page);

  Future<MovieListResponse> trendingMovies(
      String mediaType, String timeWindow, String apiKey);

  Future<MovieListResponse> recommendations(int id, String apiKey, int? page);

  Future<MovieListResponse> similarMovies(int id, String apiKey, int? page);

  Future<MovieListResponse> topRatedMovies(String apiKey, int? page);

  Future<ReviewResponse> reviews(int id, String apiKey, int? page);

  Future<UpcomingResponse> upcoming(String apiKey, int? page);

  Future<NowPlayingResponse> nowPlaying(String apiKey, int? page);

  Future<MovieListResponse> discoverMovie(
      String apiKey, int? page, String genres);

  Future<GenreResponse> genreList(String apiKey);

  Future<MovieDetail> movieDetail(String apiKey, int movieId);

  Future<KeywordResponse> keywords(String apiKey, int movieID);

  Future<CreditResponse> credits(String apiKey, int movieID);

  Future<ImageResponse> images(String apiKey, int movieId);

  Future<VideoResponse> videos(String apiKey, int movieId);

  Future<PersonResponse> trendingPersonForWeek(String apiKey);
}
