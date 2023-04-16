import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/person/bloc/person_bloc.dart';
import 'package:movie_app/features/person/page/view/person_view.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int personId =  ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (_) => PersonBloc(personId),
      child: const PersonView(),
    );
  }
}
