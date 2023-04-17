import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_app/features/home/bloc/genre_movie_list_bloc.dart';
import 'package:movie_app/features/home/page/view/home_view.dart';
import 'package:movie_app/shared/items/item_suggestion.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';
import 'package:movie_app/shared/items/item_discover_movie.dart';
import 'package:movie_app/shared/widgets/search_movie_widget.dart';
import 'package:movie_app/shared/widgets/view_more_widget.dart';

import '../../bloc/genre_movie_list_state.dart';

class GenreList extends StatelessWidget {
  const GenreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreMovieListBloc, GenreMovieListState>(
        builder: (context, state) => state.genres.isNotEmpty
            ? DefaultTabController(
                length: state.genres.length,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    elevation: 0.0,
                    title: const Text(
                      'Movie App',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.teal,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black,
                      tabs: state.genres
                          .map((e) => Tab(text: e.name.toUpperCase()))
                          .toList(),
                      onTap: (index) {
                        BlocProvider.of<GenreMovieListBloc>(context)
                            .onTabGenreClicked(index);
                      },
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: MovieSearchDelegate(),
                            );
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 12.0),
                        state.loadingStatus == LoadingMovieStatus.success
                            ? state.movies.isNotEmpty
                                ? SizedBox(
                                    height: 260.0,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List<Widget>.generate(
                                                state.movies.length + 1,
                                                (index) => index >=
                                                        state.movies.length
                                                    ? Center(
                                                        child: ViewMoreWidget(
                                                            onViewMore: () {}))
                                                    : ItemDiscoverMovie(
                                                        movie: state
                                                            .movies[index]))
                                            .toList(),
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: Text(
                                    'Loading Error',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ))
                            : const LoadingDataWidget(
                                viewType: LoadingViewType.movieByGenre),
                        const SizedBox(height: 16.0),
                        const HomeView(),
                      ],
                    ),
                  ),
                ))
            : const LoadingDataWidget(viewType: LoadingViewType.initial));
  }
}

class MovieSearchDelegate extends SearchDelegate<String> {
  List<Movie> trendingMovies = [];
  final movieRepository = Get.find<MovieDataRepository>();

  MovieSearchDelegate() {
    getSuggestionMovies();
  }

  Future<void> getSuggestionMovies() async {
    try {
      final trendingResponse = await movieRepository.trendingMovies(
          'movie', 'week', AppConstants.apiKey);
      if (trendingResponse.movies.isNotEmpty) {
        trendingMovies = trendingResponse.movies;
      }
    } catch (error) {
      trendingMovies = [];
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(fontSize: 14.0),
        elevation: 0.0,
      ),
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchMovieWidget(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return trendingMovies.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: trendingMovies.length,
            itemBuilder: (context, index) {
              return ItemSuggestion(movie: trendingMovies[index]);
            })
        : const SizedBox();
  }
}
