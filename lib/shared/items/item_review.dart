import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/model.dart';

class ItemReview extends StatefulWidget {
  final Review review;

  const ItemReview({Key? key, required this.review}) : super(key: key);

  @override
  State<ItemReview> createState() => _ItemReviewState();
}

class _ItemReviewState extends State<ItemReview> {
  var avatarProfile = '';

  @override
  void initState() {
    if (widget.review.authorDetail.avatarPath != null) {
      log('Data: ${widget.review.authorDetail.avatarPath!}');
      if (widget.review.authorDetail.avatarPath!.contains('https://')) {
        avatarProfile = widget.review.authorDetail.avatarPath!.substring(1);
      } else {
        avatarProfile =
            '${AppConstants.imageUrl}${widget.review.authorDetail.avatarPath!}';
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0.0,
      horizontalTitleGap: 8.0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle,
          image: widget.review.authorDetail.avatarPath != null
              ? DecorationImage(
                  image: NetworkImage(avatarProfile),
                  fit: BoxFit.fill,
                )
              : null,
        ),
      ),
      title: Text(
        widget.review.author,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w900,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.review.content,
            maxLines: widget.review.content.length > 30 ? 3 : null,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12.0),
          ),
          widget.review.content.length > 30
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    widget.review.content.length > 30
                        ? 'View more'
                        : 'Show less',
                    style: const TextStyle(fontSize: 12.0, color: Colors.teal),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
