import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/shared/items/item_recommended_movie.dart';

import '../../bloc/movie_detail_state.dart';

class RecommendedMovieList extends StatelessWidget {
  const RecommendedMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) => state.recommendedList != null &&
                state.recommendedList!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Recommendations',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      height: 150.0,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                BlocProvider.of<MovieDetailBloc>(context)
                                    .onItemRecommendationMovieListClicked(
                                        state.recommendedList![index].idMovie);
                              },
                              child: ItemRecommendedMovie(
                                  movie: state.recommendedList![index]),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8.0),
                          itemCount: state.recommendedList!.length),
                    ),
                  ],
                ),
              )
            : const SizedBox());
  }
}
