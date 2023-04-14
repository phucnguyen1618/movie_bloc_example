import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/genre_movie_list_bloc.dart';
import 'package:movie_app/features/home/page/view/home_view.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';
import 'package:movie_app/shared/items/item_discover_movie.dart';

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
                          onPressed: () {},
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
                        state.movies.isNotEmpty
                            ? SizedBox(
                                height: 260.0,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: state.movies
                                        .map((e) => ItemDiscoverMovie(movie: e))
                                        .toList(),
                                  ),
                                ),
                              )
                            : const LoadingDataWidget(
                                viewType: LoadingViewType.movieByGenre),
                        const SizedBox(height: 16.0),
                        const HomeView(),
                      ],
                    ),
                  ),
                ))
            : const CircularProgressIndicator());
  }
}
