import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_state.dart';
import 'package:movie_app/shared/items/item_similar_movie.dart';

class SimilarMovieList extends StatelessWidget {
  const SimilarMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) => state.similarMovieList != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Similar Movies',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  height: 150.0,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemSimilarMovie(
                          movie: state.similarMovieList![index],
                          onView: () {
                            BlocProvider.of<MovieDetailBloc>(context)
                                .onItemSimilarMovieListClicked(
                                    state.similarMovieList![index].idMovie);
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8.0),
                      itemCount: state.similarMovieList!.length),
                )
              ],
            )
          : const SizedBox(),
    );
  }
}
