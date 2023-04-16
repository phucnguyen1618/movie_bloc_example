import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/home/bloc/home_state.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';
import 'package:movie_app/shared/items/item_nowplaying_movie.dart';

import '../../../../shared/widgets/view_more_widget.dart';
import '../../../movie_list/bloc/movie_list_bloc.dart';
import '../../../movie_list/page/movie_list_page.dart';

class NowPlayingMovieList extends StatelessWidget {
  const NowPlayingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Now Playing",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900)),
                const SizedBox(height: 12.0),
                state.nowPlayingStatus == MovieStatus.success
                    ? SizedBox(
                        height: 200.0,
                        child: ListView.separated(
                            itemCount: state.nowPlayingMovies!.length + 1,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return index >= state.nowPlayingMovies!.length
                                  ? Center(
                                    child: ViewMoreWidget(onViewMore: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const MovieListPage(),
                                                settings: const RouteSettings(
                                                    name: 'movie_type',
                                                    arguments:
                                                        MovieType.nowPlaying)));
                                      }),
                                  )
                                  : ItemNowPlayingMovie(
                                      movie: state.nowPlayingMovies![index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12.0)),
                      )
                    : const LoadingDataWidget(
                        viewType: LoadingViewType.nowPlaying),
              ],
            ));
  }
}
