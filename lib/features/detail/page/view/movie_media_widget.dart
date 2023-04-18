import 'package:flutter/material.dart';
import 'package:movie_api/response/video_response.dart';
import 'package:movie_app/features/detail/page/view/backdrop_list.dart';
import 'package:movie_app/features/detail/page/view/poster_list.dart';
import 'package:movie_app/features/detail/page/view/video_list.dart';
import 'package:movie_api/model/image.dart' as image;

class MovieMediaWidget extends StatelessWidget {
  final List<image.Image> posterList;
  final List<image.Image> backdropList;
  final List<Results> videoList;

  const MovieMediaWidget({
    Key? key,
    required this.posterList,
    required this.backdropList,
    required this.videoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TabBar(
              indicatorColor: Colors.teal,
              labelColor: Colors.teal,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Videos ${videoList.length}'.toUpperCase()),
                Tab(text: 'Backdrops ${backdropList.length}'.toUpperCase()),
                Tab(text: 'Posters ${posterList.length}'.toUpperCase()),
              ]),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 200.0,
          child: TabBarView(children: [
            VideoList(videos: videoList),
            BackdropList(backdrops: backdropList),
            PosterList(posters: posterList),
          ]),
        )
      ],
    );
  }
}
