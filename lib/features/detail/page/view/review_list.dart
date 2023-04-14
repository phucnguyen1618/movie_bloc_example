import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/review_movie_bloc.dart';
import 'package:movie_app/features/detail/bloc/review_movie_state.dart';
import 'package:movie_app/shared/items/item_review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewMovieBloc, ReviewMovieState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8.0),
          state.loadingStatus == LoadingReviewStatus.success
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ItemReview(review: state.reviews![index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12.0),
                  itemCount:
                      state.reviews!.length > 3 ? 3 : state.reviews!.length,
                )
              : const Center(
                  child: Text(
                    "We don't have any review data for this movie. You can help by rating the movies you've seen.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
          state.reviews!.length > 3
              ? Center(
                  child: TextButton(
                      onPressed: () {
                        BlocProvider.of<ReviewMovieBloc>(context)
                            .onViewAllMovieReview(context);
                      },
                      child: const Text(
                        "View all reviews",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      )))
              : const SizedBox()
        ],
      ),
    );
  }
}
