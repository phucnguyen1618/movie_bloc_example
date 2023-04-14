import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/model.dart';

import '../../features/detail/page/movie_detail_page.dart';

class ItemDiscoverMovie extends StatelessWidget {
  final Movie movie;

  const ItemDiscoverMovie({Key? key, required this.movie}) : super(key: key);

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
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 150.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150.0,
              height: 225.0,
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8.0),
                image: movie.posterPath != null
                    ? DecorationImage(
                        image: NetworkImage(
                            AppConstants.imageUrl + movie.posterPath!),
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
            ),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
