import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/page/movie_detail_page.dart';
import 'package:movie_app/features/movie_list/bloc/movie_event.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_state.dart';
import 'package:movie_app/shared/items/item_movie_list.dart';

import '../../../../shared/widgets/widget_error.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Movie List',
            style: TextStyle(color: Colors.black, fontSize: 18.0)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<MovieListBloc, MovieListState>(
            builder: (context, state) {
          switch (state.status) {
            case LoadingMovieListStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case LoadingMovieListStatus.success:
              if (state.movieList != null) {
                return _buildMovieList(state);
              }
              return const SizedBox();
            case LoadingMovieListStatus.failure:
              return const WidgetError();
          }
        }),
      ),
    );
  }

  Widget _buildMovieList(MovieListState state) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: state.isHaveLoadMore
            ? state.movieList!.length + 1
            : state.movieList!.length,
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.72,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) => index >= state.movieList!.length
            ? const CircularProgressIndicator()
            : ItemMovieList(
                movie: state.movieList![index],
                onView: (movieId) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MovieDetailPage(),
                          settings: RouteSettings(
                              name: 'movie_id', arguments: movieId)));
                },
              ));
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<MovieListBloc>().add(MovieFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
