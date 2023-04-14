import 'package:equatable/equatable.dart';
import 'package:movie_api/model/image.dart';
import 'package:movie_api/response/video_response.dart';

class MediaMovieState extends Equatable {
  final LoadingMediaStatus loadingStatus;
  final List<Image>? posters;
  final List<Image>? backdrops;
  final List<Results>? videos;

  const MediaMovieState({
    required this.loadingStatus,
    this.posters,
    this.backdrops,
    this.videos,
  });

  MediaMovieState copyWith({
    required LoadingMediaStatus status,
    List<Image>? posterList,
    List<Image>? backdropList,
    List<Results>? videoList,
  }) {
    return MediaMovieState(
      loadingStatus: status,
      posters: posterList ?? [],
      backdrops: backdropList ?? [],
      videos: videoList ?? [],
    );
  }

  @override
  List<Object?> get props => [posters, backdrops, videos];
}

enum LoadingMediaStatus { loading, success, failure }
