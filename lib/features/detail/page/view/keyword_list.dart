import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/features/detail/bloc/movie_detail_state.dart';

import '../../../../shared/items/item_keyword.dart';

class KeywordList extends StatelessWidget {
  const KeywordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) => state.keywords.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Keywords',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: state.keywords
                      .map<Widget>((e) => ItemKeyword(content: e.name))
                      .toList(),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
