import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/media_movie_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/features/detail/bloc/review_movie_bloc.dart';
import 'package:movie_app/features/detail/page/view/movie_detail_view.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieID = ModalRoute.of(context)!.settings.arguments as int;
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailBloc>(create: (_) => MovieDetailBloc(movieID)),
        BlocProvider<MediaMovieBloc>(create: (_) => MediaMovieBloc(movieID)),
        BlocProvider<ReviewMovieBloc>(create: (_) => ReviewMovieBloc(movieID)),
      ],
      child: const MovieDetailView(),
    );
  }
}
