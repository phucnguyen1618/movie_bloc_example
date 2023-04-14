import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/person.dart';

@immutable
class HomeState extends Equatable {
  final MovieStatus trendingStatus;
  final MovieStatus upcomingStatus;
  final MovieStatus popularStatus;
  final MovieStatus nowPlayingStatus;
  final MovieStatus topRatedStatus;
  final List<Movie>? trendingMovies;
  final List<Movie>? popularMovies;
  final List<Movie>? upcomingMovies;
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? topRatedMovies;
  final List<Person>? trendingPersons;

  const HomeState({
    required this.trendingStatus,
    required this.upcomingStatus,
    required this.popularStatus,
    required this.nowPlayingStatus,
    this.trendingMovies,
    this.popularMovies,
    this.upcomingMovies,
    this.nowPlayingMovies,
    required this.topRatedStatus,
    this.topRatedMovies,
    this.trendingPersons,
  });

  HomeState copyWith({
    MovieStatus? trending,
    MovieStatus? upcoming,
    MovieStatus? popular,
    MovieStatus? nowPlaying,
    MovieStatus? topRated,
    List<Movie>? trendingList,
    List<Movie>? popularList,
    List<Movie>? upcomingList,
    List<Movie>? nowPlayingList,
    List<Movie>? topRatedList,
    List<Person>? trendingPersonList,
  }) {
    return HomeState(
      trendingStatus: trending ?? MovieStatus.initial,
      popularStatus: popular ?? MovieStatus.initial,
      upcomingStatus: upcoming ?? MovieStatus.initial,
      nowPlayingStatus: nowPlaying ?? MovieStatus.initial,
      topRatedStatus: topRated ?? MovieStatus.initial,
      popularMovies: popularList ?? [],
      trendingMovies: trendingList ?? [],
      upcomingMovies: upcomingList ?? [],
      nowPlayingMovies: nowPlayingList ?? [],
      topRatedMovies: topRatedList ?? [],
      trendingPersons: trendingPersonList ?? [],
    );
  }

  @override
  List<Object?> get props => [
        trendingMovies,
        popularMovies,
        trendingStatus,
        upcomingStatus,
        popularStatus,
        upcomingMovies,
        nowPlayingMovies,
        nowPlayingStatus,
        topRatedStatus,
        topRatedMovies,
        trendingPersons,
      ];
}

enum MovieStatus { initial, loading, success, failure }
