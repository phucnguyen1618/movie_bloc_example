import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_state.dart';

import '../../../../shared/items/item_credit.dart';

class CreditMovieList extends StatelessWidget {
  const CreditMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Crews Of The Movie',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12.0),
                state.crews != null
                    ? SizedBox(
                  height: 150.0,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemCredit(
                          name: state.crews![index].name,
                          profile: state.crews![index].profilePath ?? '',
                          job: state.crews![index].job,
                        );
                      },
                      separatorBuilder: (context, index) =>
                      const SizedBox(width: 12.0),
                      itemCount: state.crews!.length),
                )
                    : const CircularProgressIndicator(),
                const SizedBox(height: 24.0),
                const Text(
                  'Cast Of The Movie',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12.0),
                state.casts != null
                    ? SizedBox(
                        height: 150.0,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ItemCredit(
                                name: state.casts![index].name,
                                profile: state.casts![index].profilePath ?? '',
                                job: state.casts![index].character,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12.0),
                            itemCount: state.casts!.length),
                      )
                    : const CircularProgressIndicator(),
              ],
            ));
  }
}
