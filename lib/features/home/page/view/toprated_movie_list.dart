import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/home/bloc/home_state.dart';
import 'package:movie_app/shared/items/item_toprated_movie.dart';

import '../../../../shared/widgets/loading_data_widget.dart';

class TopRatedMovieList extends StatelessWidget {
  const TopRatedMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                child: Text("Top Rated",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("View More",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900)),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 16.0,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          state.topRatedStatus == MovieStatus.success
              ? SizedBox(
                  height: 230.0,
                  child: GridView.builder(
                      itemCount: state.topRatedMovies!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.25,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                      ),
                      itemBuilder: (context, index) => ItemTopRatedMovie(
                          movie: state.topRatedMovies![index])))
              : const LoadingDataWidget(viewType: LoadingViewType.trending),
        ],
      ),
    );
  }
}
