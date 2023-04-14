import 'package:dio/dio.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/genre.dart';
import 'package:movie_api/response/genre_response.dart';
import 'package:retrofit/http.dart';

import '../model/movie_detail.dart';
import '../response/credit_response.dart';
import '../response/image_response.dart';
import '../response/keyword_response.dart';
import '../response/movie_list_response.dart';
import '../response/now_playing_response.dart';
import '../response/person_response.dart';
import '../response/review_response.dart';
import '../response/upcoming_response.dart';
import '../response/video_response.dart';

part 'movie_data_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class MovieDataAPI {
  factory MovieDataAPI(Dio dio, {String? baseUrl}) = _MovieDataAPI;

  @GET('/movie/popular')
  Future<MovieListResponse> getPopularMovies(
      @Query('api_key') String apiKey, @Query('page') int? page);

  @GET('/trending/{media_type}/{time_window}')
  Future<MovieListResponse> getTrendingMovies(
      @Path('media_type') String mediaType,
      @Path('time_window') String timeWindow,
      @Query('api_key') String apiKey);

  @GET('/movie/{movie_id}/recommendations')
  Future<MovieListResponse> getRecommendations(
    @Path('movie_id') int movieID,
    @Query('api_key') String apiKey,
    @Query('page') int? page,
  );

  @GET('/movie/{movie_id}/similar')
  Future<MovieListResponse> getSimilarMovies(
    @Path('movie_id') int movieID,
    @Query('api_key') String apiKey,
    @Query('page') int? page,
  );

  @GET('/movie/top_rated')
  Future<MovieListResponse> getTopRatedMovies(
    @Query('api_key') String apiKey,
    @Query('page') int? page,
  );

  @GET('/movie/{movie_id}/reviews')
  Future<ReviewResponse> getReviews(
    @Path('movie_id') int movieID,
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int? page,
  );

  @GET('/movie/upcoming')
  Future<UpcomingResponse> getUpcoming(
      @Query('api_key') String apiKey, @Query('page') int? page);

  @GET('/movie/now_playing')
  Future<NowPlayingResponse> getNowPlaying(
      @Query('api_key') String apiKey, @Query('page') int? page);

  @GET('/discover/movie')
  Future<MovieListResponse> getMovieDiscover(
    @Query('api_key') String apiKey,
    @Query('page') int? page,
    @Query('with_genres') String genres,
  );

  @GET('/genre/movie/list')
  Future<GenreResponse> getGenres(@Query('api_key') String apiKey);

  @GET('/movie/{movie_id}')
  Future<MovieDetail> movieDetail(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieID,
  );

  @GET('/movie/{movie_id}/keywords')
  Future<KeywordResponse> getKeyword(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieID,
  );

  @GET('/movie/{movie_id}/credits')
  Future<CreditResponse> getCredits(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieID,
  );

  @GET('/movie/{movie_id}/images')
  Future<ImageResponse> getImages(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieID,
  );

  @GET('/movie/{movie_id}/videos')
  Future<VideoResponse> getVideos(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
  );

  @GET('/trending/person/week')
  Future<PersonResponse> getTrendingPersonForWeek(
      @Query('api_key') String apiKey);
}
