import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_state.dart';
import 'package:movie_app/features/detail/page/view/keyword_list.dart';
import 'package:movie_app/features/detail/page/view/recommended_movie_list.dart';
import 'package:movie_app/features/detail/page/view/movie_media_widget.dart';
import 'package:movie_app/features/detail/page/view/review_list.dart';
import 'package:movie_app/features/detail/page/view/similar_movie_list.dart';
import 'package:movie_app/shared/utils/app_utils.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';

import 'credit_movie_list.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) => state.movieDetail != null
          ? DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.library_add_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 120.0,
                              height: 180.0,
                              decoration: BoxDecoration(
                                image: state.movieDetail!.posterPath != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            AppConstants.imageUrl +
                                                state.movieDetail!.posterPath!),
                                        fit: BoxFit.fill,
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.movieDetail!.title,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    AppUtils.formatDateTime(
                                        state.movieDetail!.releaseDate),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    state.movieDetail!.genres
                                        .map((e) => e.name)
                                        .toString()
                                        .replaceAll('(', '')
                                        .replaceAll(')', ''),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  const Text(
                                    'Budget',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    AppUtils.formatMoney(
                                        state.movieDetail!.budget.toDouble()),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  const Text(
                                    'Revenue',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    AppUtils.formatMoney(
                                        state.movieDetail!.revenue.toDouble()),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Overview',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          state.movieDetail!.overview,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 24.0),
                        const KeywordList(),
                        const SizedBox(height: 24.0),
                        const CreditMovieList(),
                        const SizedBox(height: 24.0),
                        const ReviewList(),
                        const SizedBox(height: 24.0),
                        const MovieMediaWidget(),
                        const SizedBox(height: 24.0),
                        const RecommendedMovieList(),
                        const SimilarMovieList(),
                      ],
                    ),
                  ),
                ),
              ))
          : const LoadingDataWidget(viewType: LoadingViewType.movieDetail),
    );
  }
}
