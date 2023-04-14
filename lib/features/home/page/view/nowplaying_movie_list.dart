import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/home/bloc/home_state.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';
import 'package:movie_app/shared/items/item_nowplaying_movie.dart';

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
                            itemCount: state.nowPlayingMovies!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ItemNowPlayingMovie(
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
