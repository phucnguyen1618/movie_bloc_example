import 'package:bloc/bloc.dart';
import 'package:movie_app/features/person/bloc/person_state.dart';

class PersonBloc extends BlocBase<PersonState> {

  PersonBloc() : super(PersonState());

}