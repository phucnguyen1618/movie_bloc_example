import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/features/detail/page/view/movie_detail_view.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieID = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider<MovieDetailBloc>(
      create: (_) => MovieDetailBloc(movieID),
      child: const MovieDetailView(),
    );
  }
}
