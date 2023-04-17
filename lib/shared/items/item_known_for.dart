import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie_cast.dart';

class ItemKnownFor extends StatelessWidget {
  final MovieCast movieCast;
  final Function(int id) onDetail;

  const ItemKnownFor({Key? key, required this.movieCast, required this.onDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onDetail(movieCast.id),
      child: SizedBox(
        width: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150.0,
              height: 200.0,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: Colors.teal,
                image: movieCast.posterPath != null
                    ? DecorationImage(
                        image: NetworkImage(
                            AppConstants.imageUrl + movieCast.posterPath!),
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              movieCast.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              movieCast.character,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
