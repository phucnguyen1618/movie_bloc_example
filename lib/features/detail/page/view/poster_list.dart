import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/image.dart' as image;
import 'package:movie_app/shared/widgets/view_more_widget.dart';

class PosterList extends StatelessWidget {
  final List<image.Image> posters;

  const PosterList({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            posters.length > 5 ? 6 : posters.length,
            (index) => index >= 5
                ? ViewMoreWidget(
                    onViewMore: () {},
                  )
                : Container(
                    width: 120.0,
                    height: 180.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(AppConstants.imageUrl +
                                posters[index].filePath))),
                  )).toList(),
      ),
    );
  }
}
