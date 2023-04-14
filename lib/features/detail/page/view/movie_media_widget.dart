import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/media_movie_state.dart';
import 'package:movie_app/features/detail/page/view/backdrop_list.dart';
import 'package:movie_app/features/detail/page/view/poster_list.dart';
import 'package:movie_app/features/detail/page/view/video_list.dart';

import '../../bloc/media_movie_bloc.dart';

class MovieMediaWidget extends StatelessWidget {
  const MovieMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaMovieBloc, MediaMovieState>(
        builder: (context, state) =>
            state.loadingStatus == LoadingMediaStatus.success
                ? Column(
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
                              Tab(
                                  text: 'Videos ${state.videos!.length}'
                                      .toUpperCase()),
                              Tab(
                                  text: 'Backdrops ${state.backdrops!.length}'
                                      .toUpperCase()),
                              Tab(
                                  text: 'Posters ${state.posters!.length}'
                                      .toUpperCase()),
                            ]),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        height: 200.0,
                        child: TabBarView(children: [
                          VideoList(videos: state.videos!),
                          BackdropList(backdrops: state.backdrops!),
                          PosterList(posters: state.posters!),
                        ]),
                      )
                    ],
                  )
                : const Center(child: CircularProgressIndicator()));
  }
}
