import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/model.dart';

class ItemSimilarMovie extends StatelessWidget {
  final Movie movie;
  final Function() onView;

  const ItemSimilarMovie({
    Key? key,
    required this.movie,
    required this.onView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onView(),
      child: SizedBox(
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.teal,
                  image: movie.posterPath != null
                      ? DecorationImage(
                          image: NetworkImage(
                              AppConstants.imageUrl + movie.posterPath!),
                          fit: BoxFit.fill,
                        )
                      : null),
            ),
            const SizedBox(height: 4.0),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
