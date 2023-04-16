import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';

import '../../../../shared/items/item_trending_movie.dart';
import '../../../../shared/widgets/view_more_widget.dart';
import '../../../movie_list/bloc/movie_list_bloc.dart';
import '../../../movie_list/page/movie_list_page.dart';
import '../../bloc/home_state.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("What's Popular",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900)),
            const SizedBox(height: 16.0),
            state.popularStatus == MovieStatus.success
                ? SizedBox(
                    height: 320.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => index >=
                              state.popularMovies!.length
                          ? Center(
                              child: ViewMoreWidget(onViewMore: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const MovieListPage(),
                                        settings: const RouteSettings(
                                            name: 'movie_type',
                                            arguments: MovieType.popular)));
                              }),
                            )
                          : ItemTrendingMovie(
                              movie: state.popularMovies![index]),
                      itemCount: state.popularMovies!.length + 1,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12.0),
                    ),
                  )
                : const LoadingDataWidget(viewType: LoadingViewType.trending)
          ],
        );
      },
    );
  }
}
