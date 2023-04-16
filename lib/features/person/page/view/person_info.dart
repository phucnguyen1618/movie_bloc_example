import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
  final String acting;
  final String gender;
  final String? birthday;
  final String? placeOfBirth;
  final String knownCredits;
  final String alsoKnownAs;

  const PersonInfo({
    Key? key,
    required this.acting,
    required this.gender,
    this.birthday,
    this.placeOfBirth,
    required this.knownCredits,
    required this.alsoKnownAs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Known For',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  acting,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Birthday',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  birthday ?? 'No birthday',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Gender',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  gender,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Known Credits',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  knownCredits,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Place of Birth',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  placeOfBirth ?? 'No place',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Also Known As',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  alsoKnownAs,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
