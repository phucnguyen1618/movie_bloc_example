import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/constants/app_constants.dart';
import 'package:movie_app/features/person/bloc/person_bloc.dart';
import 'package:movie_app/features/person/bloc/person_state.dart';
import 'package:movie_app/features/person/page/view/known_for.dart';
import 'package:movie_app/features/person/page/view/person_info.dart';
import 'package:movie_app/shared/widgets/loading_data_widget.dart';

class PersonView extends StatelessWidget {
  const PersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) => state.personDetail != null
          ? Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                title: Text(
                  state.personDetail!.name!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            image: state.personDetail!.profilePath != null
                                ? DecorationImage(
                                    image: NetworkImage(AppConstants.imageUrl +
                                        state.personDetail!.profilePath!),
                                    fit: BoxFit.fill,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Personal Info',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            PersonInfo(
                              acting: state.personDetail!.knownForDepartment!,
                              gender: state.personDetail!.gender! == 2
                                  ? 'Male'
                                  : 'Female',
                              birthday:
                                  state.personDetail!.birthday ?? 'No birthday',
                              knownCredits: '3',
                              alsoKnownAs:
                                  state.personDetail!.alsoKnownAs != null &&
                                          state.personDetail!.alsoKnownAs!
                                              .isNotEmpty
                                      ? state.personDetail!.alsoKnownAs!
                                          .map((e) => '$e\n')
                                          .toList()
                                          .toString()
                                      : 'No known as',
                            ),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    const KnownFor(),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Biography',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      state.personDetail!.biography ?? 'No biography',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const LoadingDataWidget(viewType: LoadingViewType.personDetail),
    );
  }
}
