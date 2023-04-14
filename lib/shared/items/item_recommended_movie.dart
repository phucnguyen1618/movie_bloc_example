import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/model.dart';

class ItemRecommendedMovie extends StatelessWidget {
  final Movie movie;

  const ItemRecommendedMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                      fit: BoxFit.fill,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
