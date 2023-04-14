import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/home/bloc/home_state.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';
import 'package:movie_app/shared/items/item_upcoming_movie.dart';

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => state.upcomingStatus == MovieStatus.success
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: state.upcomingMovies!
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ItemUpcomingMovie(movie: e),
                          ))
                      .toList()),
            )
          : const LoadingDataWidget(viewType: LoadingViewType.upcoming),
    );
  }
}
