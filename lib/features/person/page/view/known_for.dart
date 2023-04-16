import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_app/features/person/bloc/person_bloc.dart';
import 'package:movie_app/features/person/bloc/person_state.dart';
import 'package:movie_app/shared/items/item_known_for.dart';

class KnownFor extends StatelessWidget {
  const KnownFor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Known for',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                state.movieCasts != null
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.movieCasts!
                              .map((e) => ItemKnownFor(movieCast: e))
                              .toList(),
                        ),
                      )
                    : const Text(
                        'No known for.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
              ],
            ));
  }
}
