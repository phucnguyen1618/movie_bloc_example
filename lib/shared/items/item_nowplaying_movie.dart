import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie.dart';

import '../../features/detail/page/movie_detail_page.dart';

class ItemNowPlayingMovie extends StatelessWidget {
  final Movie movie;

  const ItemNowPlayingMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MovieDetailPage(),
              settings: RouteSettings(name: 'detail', arguments: movie.idMovie),
            ));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Column(
          children: [
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.teal,
                image: movie.backdropPath != null
                    ? DecorationImage(
                        image: NetworkImage(
                            AppConstants.imageUrl + movie.backdropPath!),
                        fit: BoxFit.fitWidth,
                      )
                    : null,
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
                    color: Colors.teal,
                    image: movie.posterPath != null
                        ? DecorationImage(
                            image: NetworkImage(
                                AppConstants.imageUrl + movie.posterPath!),
                            fit: BoxFit.cover,
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
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            movie.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          const SizedBox(width: 2.0),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 12,
                          )
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
    );
  }
}
