import 'package:flutter/material.dart';
import 'package:movie_api/constants/app_constants.dart';

class ItemCredit extends StatelessWidget {
  final String name;
  final String? profile;
  final String? job;
  final Function()? onView;

  const ItemCredit({
    Key? key,
    required this.name,
    this.profile,
    this.job,
    this.onView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onView != null) {
          onView!();
        }
      },
      child: Column(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
              image: profile != ''
                  ? DecorationImage(
                      image: NetworkImage(AppConstants.imageUrl + profile!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2.0),
          job != null
              ? Text(
                  job!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
