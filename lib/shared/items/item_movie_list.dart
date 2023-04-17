import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie.dart';

class ItemMovieList extends StatelessWidget {
  final Movie movie;
  final Function(int id) onView;

  const ItemMovieList({
    Key? key,
    required this.movie,
    required this.onView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onView(movie.idMovie),
      child: Container(
        decoration: BoxDecoration(
            image: movie.posterPath != null
                ? DecorationImage(
                    image:
                        NetworkImage(AppConstants.imageUrl + movie.posterPath!))
                : null),
      ),
    );
  }
}
