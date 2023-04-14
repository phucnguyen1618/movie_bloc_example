import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/genre_movie_list_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/home/page/view/genre_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => HomeBloc()),
      BlocProvider(create: (_) => GenreMovieListBloc()),
    ], child: const GenreList());
  }
}
