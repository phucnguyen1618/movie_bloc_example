import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/model.dart';
import 'package:movie_app/features/detail/page/movie_detail_page.dart';
import 'package:movie_app/shared/utils/app_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ItemTrendingMovie extends StatelessWidget {
  final Movie movie;

  const ItemTrendingMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MovieDetailPage(),
              settings: RouteSettings(name: 'movie_id', arguments: movie.idMovie),
            ));
      },
      child: SizedBox(
        width: 150.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 150.0,
                  height: 225.0,
                  margin: const EdgeInsets.only(bottom: 17.0),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8.0),
                    image: movie.posterPath != null
                        ? DecorationImage(
                            image: NetworkImage(
                                AppConstants.imageUrl + movie.posterPath!))
                        : null,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 17.0,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal.shade900,
                    ),
                    child: CircularPercentIndicator(
                      radius: 23.0,
                      lineWidth: 2.0,
                      percent: movie.voteAverage / 10.0,
                      center: Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      progressColor: movie.voteAverage > 7.0
                          ? Colors.green
                          : Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(AppUtils.formatDateTime(movie.releaseDate),
                style: const TextStyle(fontSize: 14.0)),
          ],
        ),
      ),
    );
  }
}
