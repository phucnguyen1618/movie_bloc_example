import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app/features/movie_list/page/view/movie_list_view.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var type = ModalRoute.of(context)!.settings.arguments as MovieType;
    return BlocProvider(
      create: (_) => MovieListBloc(type),
      child: const MovieListView(),
    );
  }
}
