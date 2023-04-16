import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/home/bloc/home_state.dart';
import 'package:movie_app/features/person/page/person_page.dart';

import '../../../../shared/items/item_credit.dart';

class TrendingPersonList extends StatelessWidget {
  const TrendingPersonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Trending Persons for this week'.toUpperCase(),
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8.0),
          state.trendingPersons != null
              ? SizedBox(
                  height: 150.0,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemCredit(
                          name: state.trendingPersons![index].name!,
                          profile:
                              state.trendingPersons![index].profilePath ?? '',
                          job: state.trendingPersons![index].knownForDepartment,
                          onView: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PersonPage(),
                                    settings: RouteSettings(
                                        name: 'person_id',
                                        arguments:
                                            state.trendingPersons![index].id)));
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12.0),
                      itemCount: state.trendingPersons!.length),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
