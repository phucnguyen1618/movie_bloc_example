import 'package:flutter/material.dart';
import 'package:movie_app/features/home/page/view/trending_person_list.dart';
import 'package:movie_app/features/home/page/view/popular_movie_list.dart';
import 'package:movie_app/features/home/page/view/nowplaying_movie_list.dart';
import 'package:movie_app/features/home/page/view/toprated_movie_list.dart';
import 'package:movie_app/features/home/page/view/trending_movie_list.dart';
import 'package:movie_app/features/home/page/view/upcoming_movie_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TrendingMovieList(),
          SizedBox(height: 16.0),
          TopRatedMovieList(),
          SizedBox(height: 16.0),
          NowPlayingMovieList(),
          SizedBox(height: 16.0),
          UpcomingMovieList(),
          SizedBox(height: 16.0),
          PopularMovieList(),
          SizedBox(height: 24.0),
          TrendingPersonList(),
        ],
      ),
    );
  }
}
