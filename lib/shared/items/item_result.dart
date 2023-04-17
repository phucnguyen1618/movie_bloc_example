import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/model.dart';

class ItemResult extends StatelessWidget {
  final Movie movie;
  final Function(int id) onDetail;

  const ItemResult({
    Key? key,
    required this.movie,
    required this.onDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onDetail(movie.idMovie),
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
