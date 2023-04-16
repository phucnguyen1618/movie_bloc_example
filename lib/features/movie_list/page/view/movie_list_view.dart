import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../shared/widgets/widget_error.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

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
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              state.status == LoadingMovieListStatus.success
                  ? state.movieList != null
                      ? Expanded(
                          child: SmartRefresher(
                              enablePullDown: false,
                              enablePullUp: true,
                              controller: refreshController,
                              onRefresh: () {},
                              onLoading: () {
                                BlocProvider.of<MovieListBloc>(context)
                                    .onViewMore();
                                refreshController.loadComplete();
                              },
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.movieList!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.72,
                                    mainAxisSpacing: 8.0,
                                  ),
                                  itemBuilder: (context, index) => Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    AppConstants.imageUrl +
                                                        state.movieList![index]
                                                            .posterPath!))),
                                      ))))
                      : const Center(child: CircularProgressIndicator())
                  : const WidgetError()
            ],
          ),
        ),
      ),
    );
  }
}
