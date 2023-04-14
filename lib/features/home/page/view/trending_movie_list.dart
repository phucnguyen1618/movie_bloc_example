import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/shared/widgets/movie_tab_bar.dart';

import '../../../../shared/items/item_trending_movie.dart';
import '../../bloc/home_state.dart';
import '../../../../shared/widgets/loading_data_widget.dart';

class TrendingMovieList extends StatelessWidget {
  const TrendingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Trending',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900)),
                MovieTabBar(
                  firstText: 'Today',
                  lastText: 'This week',
                  onTapTabBar: () {
                    context.read<HomeBloc>().onTabTrendingClicked('day');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            state.trendingStatus == MovieStatus.success
                ? SizedBox(
                    height: 320.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ItemTrendingMovie(
                          movie: state.trendingMovies![index]),
                      itemCount: state.trendingMovies!.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12.0),
                    ),
                  )
                : const LoadingDataWidget(viewType: LoadingViewType.trending),
          ],
        );
      },
    );
  }
}
