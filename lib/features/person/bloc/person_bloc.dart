import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_api/model/movie_cast.dart';
import 'package:movie_api/model/person_detail.dart';
import 'package:movie_api/repository/movie_repository.dart';
import 'package:movie_app/features/person/bloc/person_state.dart';

class PersonBloc extends BlocBase<PersonState> {
  final movieRepository = Get.find<MovieDataRepository>();

  PersonDetail? personDetail;
  List<MovieCast>? movieCastList;

  PersonBloc(int id) : super(const PersonState()) {
    fetchDataPersonInfo(id);
  }

  Future<void> fetchDataPersonInfo(int id) async {
    try {
      final personDetailResponse =
          await movieRepository.personDetail(AppConstants.apiKey, id);
      personDetail = personDetailResponse;
      final movieCreditsResponse =
          await movieRepository.movieCreditByPerson(AppConstants.apiKey, id);
      if (movieCreditsResponse.casts.isNotEmpty) {
        movieCastList = movieCreditsResponse.casts;
      }
      emit(state.copyWith(
        detail: personDetail,
        movieCastList: movieCastList,
      ));
    } catch (error) {
      log('Error: ${error.toString()}');
      emit(state.copyWith(
        detail: null,
        movieCastList: [],
      ));
    }
  }
}
