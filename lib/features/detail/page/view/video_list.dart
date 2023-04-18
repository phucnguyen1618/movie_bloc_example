import 'package:flutter/material.dart';
import 'package:movie_api/response/video_response.dart';
import 'package:movie_app/shared/items/item_video.dart';

import '../../../../shared/widgets/view_more_widget.dart';

class VideoList extends StatelessWidget {
  final List<Results> videos;

  const VideoList({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return videos.isNotEmpty
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(
                    videos.length > 5 ? 6 : videos.length,
                    (index) => index >= 5
                        ? ViewMoreWidget(onViewMore: () {})
                        : ItemVideo(results: videos[index])).toList()),
          )
        : const Center(child: Text('No video !!!'));
  }
}
