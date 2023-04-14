import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie.dart';

import '../../features/detail/page/movie_detail_page.dart';

class ItemUpcomingMovie extends StatelessWidget {
  final Movie movie;

  const ItemUpcomingMovie({Key? key, required this.movie}) : super(key: key);

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
      child: Container(
        height: 250,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 16 * 2,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color.fromARGB(
                        Color.getAlphaFromOpacity(0.5), 15, 23, 42)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.teal,
                  image: movie.backdropPath != null
                      ? DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original${movie.backdropPath!}'),
                          fit: BoxFit.fitHeight)
                      : null,
                ),
              ),
            ),
            Positioned(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          movie.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Container(
                    width: 120.0,
                    height: 180.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: movie.backdropPath != null
                          ? DecorationImage(
                              image: NetworkImage(
                                  AppConstants.imageUrl + movie.posterPath!),
                              fit: BoxFit.fitHeight)
                          : null,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
