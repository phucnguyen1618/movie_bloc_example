import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movie_list/bloc/movie_list_bloc.dart';

abstract class MovieEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class MovieFetched extends MovieEvent {
  final MovieType? movieType;

  MovieFetched({this.movieType});

  @override
  List<Object?> get props => [movieType];
}