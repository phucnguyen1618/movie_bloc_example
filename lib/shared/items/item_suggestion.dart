import 'package:flutter/material.dart';
import 'package:movie_api/model/model.dart';

class ItemSuggestion extends StatelessWidget {
  final Movie movie;

  const ItemSuggestion({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.search,
        color: Colors.black,
      ),
      title: Text(
        movie.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      trailing: const Icon(Icons.show_chart, color: Colors.black),
    );
  }
}
