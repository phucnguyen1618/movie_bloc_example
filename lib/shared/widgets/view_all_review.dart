import 'package:flutter/material.dart';
import 'package:movie_api/model/review.dart';
import 'package:movie_app/shared/items/item_review.dart';

class ViewAllReview extends StatelessWidget {
  final List<Review> reviews;

  const ViewAllReview({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 24.0, height: 24.0),
            Text(
              '${reviews.length} reviews',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                )),
          ],
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemReview(review: reviews[index]);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12.0),
              itemCount: reviews.length),
        ),
      ],
    );
  }
}
