import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/image.dart' as image;
import 'package:movie_app/shared/widgets/view_more_widget.dart';

class BackdropList extends StatelessWidget {
  final List<image.Image> backdrops;

  const BackdropList({Key? key, required this.backdrops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            backdrops.length > 5 ? 6 : backdrops.length,
            (index) => index >= 5
                ? ViewMoreWidget(onViewMore: () {})
                : Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 180.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(AppConstants.imageUrl +
                                backdrops[index].filePath))),
                  )).toList(),
      ),
    );
  }
}
