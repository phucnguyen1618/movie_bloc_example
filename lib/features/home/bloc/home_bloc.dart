import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/model.dart';
import 'package:movie_api/model/person.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_app/features/home/bloc/home_state.dart';

class HomeBloc extends BlocBase<HomeState> {
  final movieRepository = Get.find<MovieDataRepository>();
  var data1List = <Movie>[],
      data2List = <Movie>[],
      data3List = <Movie>[],
      data4List = <Movie>[],
      data5List = <Movie>[];

  var personList = <Person>[];

  HomeBloc()
      : super(const HomeState(
          trendingStatus: MovieStatus.initial,
          popularStatus: MovieStatus.initial,
          upcomingStatus: MovieStatus.initial,
          topRatedStatus: MovieStatus.initial,
          trendingMovies: [],
          popularMovies: [],
          upcomingMovies: [],
          nowPlayingStatus: MovieStatus.initial,
          nowPlayingMovies: [],
          topRatedMovies: [],
          trendingPersons: [],
        )) {
    fetchDataHomeMovies();
  }

  Future<void> fetchDataHomeMovies() async {
    try {
      final trendingResponse = await movieRepository.trendingMovies(
          'movie', 'day', AppConstants.apiKey);
      if (trendingResponse.movies.isNotEmpty) {
        data1List = trendingResponse.movies;
      }
      final popularResponse =
          await movieRepository.popularMovies(AppConstants.apiKey, 1);
      if (popularResponse.movies.isNotEmpty) {
        data2List = popularResponse.movies;
      }
      final upcomingResponse =
          await movieRepository.upcoming(AppConstants.apiKey, 1);
      if (upcomingResponse.results.isNotEmpty) {
        data3List = upcomingResponse.results;
      }
      final nowPlayingResponse =
          await movieRepository.nowPlaying(AppConstants.apiKey, 1);
      if (nowPlayingResponse.movies.isNotEmpty) {
        data4List = nowPlayingResponse.movies;
      }
      final topRateResponse =
          await movieRepository.topRatedMovies(AppConstants.apiKey, 1);
      if (topRateResponse.movies.isNotEmpty) {
        data5List = topRateResponse.movies;
      }
      final personResponse =
          await movieRepository.trendingPersonForWeek(AppConstants.apiKey);
      if (personResponse.persons.isNotEmpty) {
        personList = personResponse.persons;
      }
      emit(state.copyWith(
        trending: MovieStatus.success,
        popular: MovieStatus.success,
        upcoming: MovieStatus.success,
        trendingList: data1List,
        popularList: data2List,
        upcomingList: data3List,
        nowPlaying: MovieStatus.success,
        nowPlayingList: data4List,
        topRated: MovieStatus.success,
        topRatedList: data5List,
        trendingPersonList: personList,
      ));
    } catch (error) {
      log('Error: ${error.toString()}');
      emit(state.copyWith(
        trending: MovieStatus.failure,
        popular: MovieStatus.failure,
        upcoming: MovieStatus.failure,
        nowPlaying: MovieStatus.failure,
        trendingList: [],
        popularList: [],
        upcomingList: [],
        nowPlayingList: [],
        topRatedList: [],
        topRated: MovieStatus.failure,
        trendingPersonList: [],
      ));
    }
  }

  Future<void> onTabTrendingClicked(String time) async {
    emit(state.copyWith(
      trending: MovieStatus.loading,
      popular: MovieStatus.success,
      upcoming: MovieStatus.success,
      trendingList: [],
      popularList: data2List,
      upcomingList: data3List,
      nowPlayingList: data4List,
      nowPlaying: MovieStatus.success,
      topRated: MovieStatus.success,
      topRatedList: data5List,
      trendingPersonList: personList,
    ));
    try {
      final trendingResponse = await movieRepository.trendingMovies(
          'movie', time, AppConstants.apiKey);
      if (trendingResponse.movies.isNotEmpty) {
        data1List = trendingResponse.movies;
      }
      emit(state.copyWith(
        trending: MovieStatus.success,
        popular: MovieStatus.success,
        upcoming: MovieStatus.success,
        trendingList: data1List,
        popularList: data2List,
        upcomingList: data3List,
        nowPlaying: MovieStatus.success,
        nowPlayingList: data4List,
        topRated: MovieStatus.success,
        topRatedList: data5List,
        trendingPersonList: personList,
      ));
    } catch (error) {
      emit(state.copyWith(
        trending: MovieStatus.failure,
        popular: MovieStatus.success,
        upcoming: MovieStatus.success,
        trendingList: [],
        popularList: data2List,
        upcomingList: data3List,
        nowPlaying: MovieStatus.success,
        nowPlayingList: data4List,
        topRated: MovieStatus.success,
        topRatedList: data5List,
        trendingPersonList: personList,
      ));
    }
  }
}
