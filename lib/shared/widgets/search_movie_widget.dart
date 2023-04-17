import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../features/detail/page/movie_detail_page.dart';
import '../items/item_result.dart';

class SearchMovieWidget extends StatefulWidget {
  final String query;

  const SearchMovieWidget({Key? key, required this.query}) : super(key: key);

  @override
  State<SearchMovieWidget> createState() => _SearchMovieWidgetState();
}

class _SearchMovieWidgetState extends State<SearchMovieWidget> {
  List<Movie> resultMovies = [];
  final movieRepository = Get.find<MovieDataRepository>();
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  bool isNotLoadMore = false;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    getResultMoviesBySearch(widget.query);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchMovieWidget oldWidget) {
    if (oldWidget.query != widget.query) {
      resultMovies.clear();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    resultMovies = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: resultMovies.isNotEmpty
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: resultMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.72,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return ItemResult(
                    movie: resultMovies[index],
                    onDetail: (int id) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MovieDetailPage(),
                              settings: RouteSettings(
                                  name: 'movie_id', arguments: id)));
                    },
                  );
                })
            : const SizedBox());
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    setState(() {
      page++;
      getResultMoviesBySearch(widget.query);
      _refreshController.loadComplete();
    });
  }

  Future<void> getResultMoviesBySearch(String keyword) async {
    try {
      if (!isNotLoadMore) {
        final resultResponse = await movieRepository
            .search(AppConstants.apiKey, keyword, page: page);
        if (resultResponse.movies.isNotEmpty) {
          setState(() {
            isLoading = false;
            resultMovies.addAll(resultResponse.movies);
            page = resultResponse.page + 1;
          });
        } else {
          setState(() {
            isNotLoadMore = true;
          });
        }
      }
    } catch (error) {
      if (mounted) {
        isLoading = false;
        resultMovies = [];
      }
    }
  }
}
