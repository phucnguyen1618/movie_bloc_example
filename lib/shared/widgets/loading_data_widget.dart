import 'package:flutter/material.dart';

class LoadingDataWidget extends StatefulWidget {
  final LoadingViewType viewType;

  const LoadingDataWidget({Key? key, required this.viewType}) : super(key: key);

  @override
  State<LoadingDataWidget> createState() => _LoadingDataWidgetState();
}

class _LoadingDataWidgetState extends State<LoadingDataWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.viewType) {
      case LoadingViewType.trending:
        return _buildTrendingMovieListLoading();
      case LoadingViewType.upcoming:
        return _buildUpcomingMovieListLoading(context);
      case LoadingViewType.nowPlaying:
        return _buildNowPlayingMovieListLoading();
      case LoadingViewType.movieByGenre:
        return _buildMovieListByGenreLoading();
      case LoadingViewType.movieDetail:
        return _buildLoadingMovieDetail();
    }
  }

  Widget _buildTrendingMovieListLoading() {
    return SizedBox(
      height: 320.0,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => SizedBox(
          width: 150.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150.0,
                height: 225.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                width: 150.0,
                height: 12.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                width: 100.0,
                height: 12.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12.0),
      ),
    );
  }

  Widget _buildUpcomingMovieListLoading(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width - 16 * 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      width: 160.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      width: 100.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      width: 130.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Container(
                width: 120.0,
                height: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12.0),
      ),
    );
  }

  Widget _buildNowPlayingMovieListLoading() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            children: [
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 12.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey.shade300,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 30.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.grey.shade300,
                              ),
                            ),
                            const SizedBox(width: 2.0),
                            Container(
                              width: 24.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12.0),
      ),
    );
  }

  Widget _buildMovieListByGenreLoading() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => SizedBox(
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150.0,
                height: 225.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                width: 100.0,
                height: 12.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12.0),
      ),
    );
  }

  Widget _buildLoadingMovieDetail() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
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
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 16.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 12.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 12.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: 100.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: 200.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Container(
                        width: 100.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Container(
                        width: 200.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 100.0,
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: 100.0,
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Container(
                    width: 100.0,
                    height: 100.0,
                    margin: const EdgeInsets.only(right: 12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ).toList(),
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: 100.0,
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                      (index) => Container(
                    width: 200.0,
                    height: 100.0,
                    margin: const EdgeInsets.only(right: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ).toList(),
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: 100.0,
              height: 12.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                      (index) => Container(
                    width: 100.0,
                    height: 100.0,
                    margin: const EdgeInsets.only(right: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum LoadingViewType {
  trending,
  upcoming,
  nowPlaying,
  movieByGenre,
  movieDetail,
}
