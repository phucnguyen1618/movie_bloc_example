import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/image.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_api/response/video_response.dart';
import 'package:movie_app/features/detail/bloc/media_movie_state.dart';

class MediaMovieBloc extends BlocBase<MediaMovieState> {
  final movieRepository = Get.find<MovieDataRepository>();
  List<Image>? moviePosters;
  List<Image>? movieBackdrops;
  List<Results>? videos;

  MediaMovieBloc(int id)
      : super(
            const MediaMovieState(loadingStatus: LoadingMediaStatus.loading)) {
    fetchDataMediaMovie(id);
  }

  Future<void> fetchDataMediaMovie(int id) async {
    try {
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
        videos = videoResponse.results;
      }
      emit(state.copyWith(
        status: LoadingMediaStatus.success,
        posterList: moviePosters,
        backdropList: movieBackdrops,
        videoList: videos,
      ));
    } catch (error) {
      log('Error: ${error.toString()}');
      emit(const MediaMovieState(loadingStatus: LoadingMediaStatus.failure));
    }
  }
}
